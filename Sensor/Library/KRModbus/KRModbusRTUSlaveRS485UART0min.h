/*

  Kandiral Ruslan
  http://kandiral.ru

  KRModbusRTUSlaveRS485UART0min.h
  Ver.: 1.0
  http://kandiral.ru/arduino/modbus_slave_na_arduino.html
    
*/

#ifndef KRMODBUSRTUSLAVERS485_H_
#define KRMODBUSRTUSLAVERS485_H_

#if ARDUINO >= 100
#include <Arduino.h>
#else
#include <WProgram.h>
#endif

#if defined(UBRRH) && defined(UBRRL)
  #define ubrrh &UBRRH
  #define ubrrl &UBRRL
  #define ucsra &UCSRA
  #define ucsrb &UCSRB
  #define ucsrc &UCSRC
  #define udr &UDR
#else
  #define ubrrh &UBRR0H
  #define ubrrl &UBRR0L
  #define ucsra &UCSR0A
  #define ucsrb &UCSR0B
  #define ucsrc &UCSR0C
  #define udr &UDR0
#endif

#include <KRRegisters.h>

#define MB_READ_TIMEOUT 50
#define MB_WEIT_RESP_TIME 5
#define MBRTU_MAX_BUF 20

uint8_t mbDataBuffer[MBRTU_MAX_BUF];
volatile uint16_t _mb_crc=0xFFFF;
volatile uint8_t mbDataBufferPos, mbDataBufferCount=0;
volatile bool MBDenyRX=false;
volatile uint8_t _mb_txen_Mask;
volatile uint8_t *_mb_txen_port;

void MBCRC(byte bt){
  _mb_crc ^= bt;
  uint16_t _mb_crc_flag;
  for(uint8_t j = 0; j < 8; j++) {
    _mb_crc_flag = _mb_crc & 0x0001;
    _mb_crc >>=1;
    if(_mb_crc_flag)_mb_crc ^= 0xA001;
  }      
}


#if defined(USART_RX_vect)
  ISR(USART_RX_vect)
#elif defined(USART0_RX_vect)
  ISR(USART0_RX_vect)
#elif defined(USART_RXC_vect)
  ISR(USART_RXC_vect) // ATmega8
#else
  #error "Don't know what the Data Received vector is called for Serial"
#endif
{
  if(!(*ucsra & (1 << UPE0))){
    uint8_t bt=*udr;  
    if(MBDenyRX || mbDataBufferCount==MBRTU_MAX_BUF)return;
    mbDataBuffer[mbDataBufferCount++]=bt;
    if(mbDataBufferCount>2)MBCRC(mbDataBuffer[mbDataBufferCount-3]);else _mb_crc = 0xFFFF;
  }else *udr;
}

#if defined(UART0_UDRE_vect)
ISR(UART0_UDRE_vect)
#elif defined(UART_UDRE_vect)
ISR(UART_UDRE_vect)
#elif defined(USART0_UDRE_vect)
ISR(USART0_UDRE_vect)
#elif defined(USART_UDRE_vect)
ISR(USART_UDRE_vect)
#else
  #error "Don't know what the Data Register Empty vector is called for Serial"
#endif
{
  if(mbDataBufferPos<mbDataBufferCount){
    *udr=mbDataBuffer[mbDataBufferPos++];
    *ucsra |= 1 << TXC0;
  }
  if(mbDataBufferPos==mbDataBufferCount){
    *ucsrb &= ~(1 << UDRIE0); 
    *ucsrb |= 1 << TXCIE0;
  }
}

#if defined(USART0_TX_vect)
ISR(USART0_TX_vect)
#elif defined(USART_TX_vect)
ISR(USART_TX_vect)
#elif defined(USART0_TXC_vect)
ISR(USART0_TXC_vect)
#elif defined(USART_TXC_vect)
ISR(USART_TXC_vect)
#else
  #error "TXC Error"
#endif
{
    *ucsrb &= ~(1 << TXCIE0); 
    mbDataBufferCount=0;
    *_mb_txen_port &= ~_mb_txen_Mask;
    MBDenyRX=false;
}

class KRModbusRTUSlaveRS485{

  private:
    KRRegisters *regs;
    uint8_t addr;
    uint8_t prvBytes=0;
    uint32_t tm, tm0;

  public:
    KRModbusRTUSlaveRS485(KRRegisters &registers, uint8_t txen_, uint8_t addr_){
      regs = &registers;
      addr=addr_;
      volatile uint8_t *reg;
      _mb_txen_Mask = digitalPinToBitMask(txen_);
      uint8_t port = digitalPinToPort(txen_);
      reg = portModeRegister(port);
      *reg |= _mb_txen_Mask;      
      _mb_txen_port = portOutputRegister(port);
      
      *_mb_txen_port &= ~_mb_txen_Mask;
    };
    void begin(uint32_t baudRate){

      uint16_t wd=(F_CPU / 4 / baudRate - 1) / 2;  
      *ucsra = 1<<U2X0;
      if (((F_CPU == 16000000UL) && (baudRate == 57600)) || (wd >4095)){
        *ucsra = 0;
        wd = (F_CPU / 8 / baudRate - 1) / 2;
      }
      *ubrrh = wd >> 8;
      *ubrrl = wd;
      *ucsrc = (1<<UCSZ01) | (1<<UCSZ00);
      *ucsrb = (1<<RXCIE0)|(1<<RXEN0)|(1<<TXEN0);

    };
    virtual void _DO();

};

void KRModbusRTUSlaveRS485::_DO(){
  uint8_t bytes=prvBytes;
  prvBytes=mbDataBufferCount;
  if(prvBytes==0)return;
  uint32_t ctm=millis();
  if (bytes!=prvBytes) {
    if(bytes==0)tm0=ctm + MB_READ_TIMEOUT;
    tm = ctm + MB_WEIT_RESP_TIME;
    return;
  } 
  if(ctm<tm0 && ctm<tm)return;   
  
  MBDenyRX=true;
  prvBytes=mbDataBufferCount;

  if(prvBytes<4 || (byte)_mb_crc != mbDataBuffer[prvBytes-2] || (byte)(_mb_crc >> 8) != mbDataBuffer[prvBytes-1] || (mbDataBuffer[0]>0 && mbDataBuffer[0]!=addr)){
      prvBytes=0;
      mbDataBufferCount=0;
      MBDenyRX=false;
      return;
  }
  
  uint16_t index, len, reg16;
  uint8_t i,n;
  _mb_crc = 0xFFFF;
  mbDataBuffer[0]=addr;
  MBCRC(mbDataBuffer[0]);
  MBCRC(mbDataBuffer[1]);
  
  switch(mbDataBuffer[1]){
    case 0x03:  
    case 0x04: 
      index=(((uint16_t)mbDataBuffer[2] << 8) | mbDataBuffer[3]);
      len=(((uint16_t)mbDataBuffer[4] << 8) | mbDataBuffer[5]);
      prvBytes=3;
      mbDataBuffer[2]=len*2;
      MBCRC(mbDataBuffer[2]);
      for(i=index;i<index+len;i++){
        reg16=regs->read(i);
        mbDataBuffer[prvBytes]=reg16 >> 8;
        MBCRC(mbDataBuffer[prvBytes]);
        prvBytes++;
        mbDataBuffer[prvBytes]=reg16;
        MBCRC(mbDataBuffer[prvBytes]);
        prvBytes++;
      }
      break;
    case 0x06: 
      index=((mbDataBuffer[2] << 8) | mbDataBuffer[3]);
      reg16=((mbDataBuffer[4] << 8) | mbDataBuffer[5]);
      regs->write(index,reg16);
      MBCRC(mbDataBuffer[2]);
      MBCRC(mbDataBuffer[3]);
      MBCRC(mbDataBuffer[4]);
      MBCRC(mbDataBuffer[5]);
      prvBytes=6;
      break;
    case 0x10: 
      index=((mbDataBuffer[2] << 8) | mbDataBuffer[3]);
      len=((mbDataBuffer[4] << 8) | mbDataBuffer[5]);
      MBCRC(mbDataBuffer[2]);
      MBCRC(mbDataBuffer[3]);
      MBCRC(mbDataBuffer[4]);
      MBCRC(mbDataBuffer[5]);
      prvBytes=6;
      n=0;
      for(i=index;i<index+len;i++){
        reg16=mbDataBuffer[6]>n?mbDataBuffer[n+7]:0;
        n++;
        reg16=(reg16 << 8) | (mbDataBuffer[6]>n?mbDataBuffer[n+7]:0);
        n++;
        regs->write(i,reg16);
      }      
      break;
    default:
      prvBytes=3;
      mbDataBuffer[1]= mbDataBuffer[1] | (uint8_t)128;
      mbDataBuffer[2]=1; // ILLEGAL FUNCTION
      _mb_crc = 0xFFFF;
      MBCRC(mbDataBuffer[0]);
      MBCRC(mbDataBuffer[1]);
      MBCRC(mbDataBuffer[2]);
  }
  
  mbDataBuffer[prvBytes++] = (byte)_mb_crc;
  mbDataBuffer[prvBytes++] = (byte)(_mb_crc >> 8);

  mbDataBufferCount=prvBytes;
  prvBytes=0;
  mbDataBufferPos=0;
  *_mb_txen_port |= _mb_txen_Mask;
  if(*ucsra & (1<<UDRE0)){
    mbDataBufferPos=1;
    *udr = mbDataBuffer[0];
    *ucsra |= 1 << TXC0;
  }
  *ucsrb |= 1 << UDRIE0;

}

#endif // KRMODBUSRTUSLAVERS485_H_
