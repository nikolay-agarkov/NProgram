/*

  Kandiral Ruslan
  http://kandiral.ru

  KRModbusASCIISlaveRS485.h
  Ver.: 1.0
  http://kandiral.ru/arduino/modbus_slave_na_arduino.html
    
*/

#ifndef KRMODBUSASCIISLAVERS485_H_
#define KRMODBUSASCIISLAVERS485_H_

#if ARDUINO >= 100
#include <Arduino.h>
#else
#include <WProgram.h>
#endif

#include <KRModbusSlave.h>

#define MBASCII_MAX_BUF 40

class KRModbusASCIISlaveRS485 : public KRModbusSlave{

  private:
    bool txenON=false;
    uint8_t serno;
    uint8_t txenMask;
    volatile uint8_t *txenPort;
    uint8_t buf[MBASCII_MAX_BUF / 2];
    uint8_t bufascii[MBASCII_MAX_BUF];
    uint8_t prvBytes=0;
    uint32_t tm, tm0;

    uint8_t toHex(uint8_t vl){return vl>9 ? vl+55 : vl+48;}
  public:
    KRModbusASCIISlaveRS485(Stream &theSerial, KRRegisters &registers, uint8_t txen_, uint8_t addr_):KRModbusSlave(theSerial, registers, addr_){
      bufascii[0]=58;
      bufascii[1]=toHex(addr_ >> 4);
      bufascii[2]=toHex(addr_ & 0xf);
      volatile uint8_t *reg;
      txenMask = digitalPinToBitMask(txen_);
      uint8_t port = digitalPinToPort(txen_);
      reg = portModeRegister(port);
      *reg |= txenMask;      
      txenPort = portOutputRegister(port);
      
      *txenPort &= ~txenMask;
          
      serno=4;
      if(&theSerial==&Serial)serno=0;
#if defined(UBRR1H)
      if(&theSerial==&Serial1)serno=1;
#endif
#if defined(UBRR2H)
      if(&theSerial==&Serial2)serno=2;
#endif
#if defined(UBRR3H)
      if(&theSerial==&Serial3)serno=3;
#endif
    };
    virtual void _DO();

};

void KRModbusASCIISlaveRS485::_DO(){
  if(txenON){
    switch( serno ){
#if defined(UBRR1H)
      case 1:txenON=(!(UCSR1A & (1 << TXC1)));break;
#endif
#if defined(UBRR2H)
      case 2:txenON=(!(UCSR2A & (1 << TXC2)));break;
#endif
#if defined(UBRR3H)
      case 3:txenON=(!(UCSR3A & (1 << TXC3)));break;
#endif
      case 0:
      default:txenON=(!(UCSR0A & (1 << TXC0)));break;
    }
    if(txenON)return; 
    *txenPort &= ~txenMask;
  }

  uint8_t bytes=serial->available(); 
  if(bytes==0)return;
  uint32_t ctm=millis();
  if (bytes!=prvBytes) {
    if(prvBytes==0)tm0=ctm + tmReadTimeout;
    prvBytes = bytes;
    tm = ctm + waitRespTime;
    return;
  } 
  if(ctm<tm0 && ctm<tm)return;   
  prvBytes=0;

  uint8_t n,bt,bt0=serial->read(),i;
  uint16_t reg16=0;
  bool b=false;
  bytes=0;
  while(n=serial->available()){
    if(n==4){
      bt=serial->read();
      bt-=bt>57?55:48;
      bt<<=4;
      n=serial->read();
      bt|=n-(n>57?55:48);
      n=serial->read();
      i=(-(int)reg16)& 0xff;    
      if(serial->read()!=10 || n!=13 || bt0!=58 || bt!=i)return;
      break;
    }else{
      if(b){
        bt=serial->read();
        buf[bytes]|=bt-(bt>57?55:48);
        reg16=(reg16 & 0xff) + buf[bytes];
        b=false;
        bytes++;
      }else{      
        buf[bytes]=serial->read();
        buf[bytes]-=buf[bytes]>57?55:48;
        buf[bytes]<<=4;
        b=true;
      }
    }
  }

  if(buf[0]>0 && buf[0]!=addr)return;

  uint16_t index, len, LRC=addr;
  bufascii[3]=toHex(buf[1] >> 4);
  bufascii[4]=toHex(buf[1] & 0xF);
  LRC=(LRC & 0xff) + buf[1];
  bt=5;
  
  switch(buf[1]){
    case 0x03:  
    case 0x04: 
      index=(((uint16_t)buf[2] << 8) | buf[3]);
      len=(((uint16_t)buf[4] << 8) | buf[5]);
      switch(len){
        case 1:
          bt=11;
          bufascii[5]=48;
          bufascii[6]=50;
          LRC=(LRC & 0xff) + 2;
          reg16=regs->read(index);
          bt0=reg16 >> 8;
          bufascii[7]=toHex(bt0 >> 4);
          bufascii[8]=toHex(bt0 & 0xf);
          LRC=(LRC & 0xff) + bt0;
          bt0=reg16;
          bufascii[9]=toHex(bt0 >> 4);
          bufascii[10]=toHex(bt0 & 0xf);
          LRC=(LRC & 0xff) + bt0;
          break;
        case 2:
          bt=15;
          bufascii[5]=48;
          bufascii[6]=52;
          LRC=(LRC & 0xff) + 4;
          reg16=regs->read(index);          
          bt0=reg16 >> 8;
          bufascii[7]=toHex(bt0 >> 4);
          bufascii[8]=toHex(bt0 & 0xf);
          LRC=(LRC & 0xff) + bt0;
          bt0=reg16;
          bufascii[9]=toHex(bt0 >> 4);
          bufascii[10]=toHex(bt0 & 0xf);
          LRC=(LRC & 0xff) + bt0;          
          reg16=regs->read(index+1);
          bt0=reg16 >> 8;
          bufascii[11]=toHex(bt0 >> 4);
          bufascii[12]=toHex(bt0 & 0xf);
          LRC=(LRC & 0xff) + bt0;
          bt0=reg16;
          bufascii[13]=toHex(bt0 >> 4);
          bufascii[14]=toHex(bt0 & 0xf);
          LRC=(LRC & 0xff) + bt0;          
          break;
        default:
          bt=7;
          bt0=len*2;
          bufascii[5]=toHex(bt0 >> 4);
          bufascii[6]=toHex(bt0 & 0xf);
          LRC=(LRC & 0xff) + bt0;
          for(i=index;i<index+len;i++){
            reg16=regs->read(i);
            bt0=reg16 >> 8;
            bufascii[bt++]=toHex(bt0 >> 4);
            bufascii[bt++]=toHex(bt0 & 0xf);
            LRC=(LRC & 0xff) + bt0;
            bt0=reg16;
            bufascii[bt++]=toHex(bt0 >> 4);
            bufascii[bt++]=toHex(bt0 & 0xf);
            LRC=(LRC & 0xff) + bt0;
          }
      }
      break;
    case 0x06: 
      index=((buf[2] << 8) | buf[3]);
      reg16=((buf[4] << 8) | buf[5]);
      regs->write(index,reg16);
      bufascii[5]=toHex(buf[2] >> 4);
      bufascii[6]=toHex(buf[2] & 0xf);
      LRC=(LRC & 0xff) + buf[2];
      bufascii[7]=toHex(buf[3] >> 4);
      bufascii[8]=toHex(buf[3] & 0xf);
      LRC=(LRC & 0xff) + buf[3];
      bufascii[9]=toHex(buf[4] >> 4);
      bufascii[10]=toHex(buf[4] & 0xf);
      LRC=(LRC & 0xff) + buf[4];
      bufascii[11]=toHex(buf[5] >> 4);
      bufascii[12]=toHex(buf[5] & 0xf);
      LRC=(LRC & 0xff) + buf[5];
      bt=13;
      break;
    case 0x10: 
      index=((buf[2] << 8) | buf[3]);
      len=((buf[4] << 8) | buf[5]);
      bufascii[5]=toHex(buf[2] >> 4);
      bufascii[6]=toHex(buf[2] & 0xf);
      LRC=(LRC & 0xff) + buf[2];
      bufascii[7]=toHex(buf[3] >> 4);
      bufascii[8]=toHex(buf[3] & 0xf);
      LRC=(LRC & 0xff) + buf[3];
      bufascii[9]=toHex(buf[4] >> 4);
      bufascii[10]=toHex(buf[4] & 0xf);
      LRC=(LRC & 0xff) + buf[4];
      bufascii[11]=toHex(buf[5] >> 4);
      bufascii[12]=toHex(buf[5] & 0xf);
      LRC=(LRC & 0xff) + buf[5];
      bt=13;
      switch(len){
        case 1:
          reg16=buf[6]>0?buf[7]:0;
          reg16=(reg16 << 8) | (buf[6]>1?buf[8]:0);
          regs->write(index,reg16);
          break;
        case 2:
          reg16=buf[6]>0?buf[7]:0;
          reg16=(reg16 << 8) | (buf[6]>1?buf[8]:0);
          regs->write(index,reg16);
          reg16=buf[6]>2?buf[9]:0;
          reg16=(reg16 << 8) | (buf[6]>3?buf[10]:0);
          regs->write(index+1,reg16);
          break;
        default:
          n=0;
          for(i=index;i<index+len;i++){
            reg16=buf[6]>n?buf[n+7]:0;
            n++;
            reg16=(reg16 << 8) | (buf[6]>n?buf[n+7]:0);
            n++;
            regs->write(i,reg16);
          }
      }      
      break;
    default: // ILLEGAL FUNCTION
      bt=7;
      LRC=addr;
      bt0= buf[1] | (uint8_t)128;
      bufascii[3]=toHex(bt0 >> 4);
      bufascii[4]=toHex(bt0 & 0xf);
      LRC=(LRC & 0xff) + bt0;
      bufascii[5]=48;
      bufascii[6]=49;
      LRC=(LRC & 0xff) + 1;
  }

  bt0=(-(int)LRC)& 0xff;
  bufascii[bt++] = toHex(bt0 >> 4);
  bufascii[bt++] = toHex(bt0 & 0xf);
  bufascii[bt++] = 13;
  bufascii[bt++] = 10;
  
  switch( serno ){
#if defined(UBRR1H)
    case 1:UCSR1A|=(1 << TXC1);break;
#endif
#if defined(UBRR2H)
    case 2:UCSR2A|=(1 << TXC2);break;
#endif
#if defined(UBRR3H)
    case 3:UCSR3A|=(1 << TXC3);break;
#endif
    case 0:
    default:UCSR0A|=(1 << TXC0);
  }
  *txenPort |= txenMask;  

  serial->write(bufascii, bt);    

  txenON=true;    

}

#endif // KRMODBUSASCIISLAVERS485_H_
