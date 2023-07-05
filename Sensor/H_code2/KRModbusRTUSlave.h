/*

  Kandiral Ruslan
  http://kandiral.ru

  KRModbusRTUSlave.h
  Ver.: 1.0
  http://kandiral.ru/arduino/modbus_slave_na_arduino.html
    
*/

#ifndef KRMODBUSRTUSLAVE_H_
#define KRMODBUSRTUSLAVE_H_

#if ARDUINO >= 100
#include <Arduino.h>
#else
#include <WProgram.h>
#endif

#include "KRModbusSlave.h"

#define MBRTU_MAX_BUF 20

class KRModbusRTUSlave : public KRModbusSlave{

  private:
    uint8_t buf[MBRTU_MAX_BUF];
    uint8_t prvBytes;
    uint32_t tm, tm0;
    uint16_t crc, flag;

    void CRC(byte bt);

  public:
    KRModbusRTUSlave(Stream &theSerial, KRRegisters &registers, uint8_t addr_):KRModbusSlave(theSerial, registers, addr_){prvBytes=0;};
    virtual void _DO();

};

void KRModbusRTUSlave::CRC(byte bt){
  crc ^= bt;
  for(uint8_t j = 0; j < 8; j++) {
    flag = crc & 0x0001;
    crc >>=1;
    if(flag)crc ^= 0xA001;
  }      
}

void KRModbusRTUSlave::_DO(){
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
  
  uint8_t n;
  crc = 0xFFFF;
  bytes=0;
  while(n=serial->available()){
    buf[bytes] = serial->read();    
    if(n>2)CRC(buf[bytes]);    
    bytes++;
    if(bytes==MBRTU_MAX_BUF && n>0)return;
  }

  if(bytes<4)return; 
  if(buf[0]>0 && buf[0]!=addr)return;

  if((byte)crc != buf[bytes-2] || (byte)(crc >> 8) != buf[bytes-1])return;

  uint16_t index, len, reg16;
  uint8_t i;
  crc = 0xFFFF;
  buf[0]=addr;
  CRC(buf[0]);
  CRC(buf[1]);
  
  switch(buf[1]){
    case 0x03:  
    case 0x04: 
      index=(((uint16_t)buf[2] << 8) | buf[3]);
      len=(((uint16_t)buf[4] << 8) | buf[5]);
      switch(len){
        case 1:
          bytes=5;
          buf[2]=2;
          CRC(buf[2]);
          reg16=regs->read(index);
          buf[3]=reg16 >> 8;
          CRC(buf[3]);
          buf[4]=reg16;
          CRC(buf[4]);
          break;
        case 2:
          bytes=7;
          buf[2]=4;
          CRC(buf[2]);
          reg16=regs->read(index);
          buf[3]=reg16 >> 8;
          CRC(buf[3]);
          buf[4]=reg16;
          CRC(buf[4]);
          reg16=regs->read(index+1);
          buf[5]=reg16 >> 8;
          CRC(buf[5]);
          buf[6]=reg16;
          CRC(buf[6]);
          break;
        default:
          bytes=3;
          buf[2]=len*2;
          CRC(buf[2]);
          for(i=index;i<index+len;i++){
            reg16=regs->read(i);
            buf[bytes]=reg16 >> 8;
            CRC(buf[bytes]);
            bytes++;
            buf[bytes]=reg16;
            CRC(buf[bytes]);
            bytes++;
          }
      }
      break;
    case 0x06: 
      index=((buf[2] << 8) | buf[3]);
      reg16=((buf[4] << 8) | buf[5]);
      regs->write(index,reg16);
      CRC(buf[2]);
      CRC(buf[3]);
      CRC(buf[4]);
      CRC(buf[5]);
      bytes=6;
      break;
    case 0x10: 
      index=((buf[2] << 8) | buf[3]);
      len=((buf[4] << 8) | buf[5]);
      CRC(buf[2]);
      CRC(buf[3]);
      CRC(buf[4]);
      CRC(buf[5]);
      bytes=6;
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
    default:
      bytes=3;
      buf[1]= buf[1] | (uint8_t)128;
      buf[2]=1; // ILLEGAL FUNCTION
      crc = 0xFFFF;
      CRC(buf[0]);
      CRC(buf[1]);
      CRC(buf[2]);
  }
  
  buf[bytes++] = (byte)crc;
  buf[bytes++] = (byte)(crc >> 8);

  TRANS;
  delay(10);
  serial->write(buf, bytes);    
  delay(10);
  RECIV;
}

#endif // KRMODBUSRTUSLAVE_H_
