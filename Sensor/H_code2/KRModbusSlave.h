/*

  Kandiral Ruslan
  http://kandiral.ru

  KRModbusSlave.h
  Ver.: 1.0
  http://kandiral.ru/arduino/modbus_slave_na_arduino.html
    
*/

#ifndef KRMODBUSSLAVE_H_
#define KRMODBUSSLAVE_H_

#if ARDUINO >= 100
#include <Arduino.h>
#else
#include <WProgram.h>
#endif

#include "Stream.h"
#include "KRRegisters.h"

class KRModbusSlave{

  protected:
    Stream *serial;
    KRRegisters *regs;
    uint32_t waitRespTime, tmReadTimeout;
    uint8_t addr;

  public:
    KRModbusSlave(Stream &theSerial, KRRegisters &registers, uint8_t addr_);
    void setWaitRespTime(uint32_t value);
    void setReadTimeout(uint32_t value);
    virtual void _DO();

};

KRModbusSlave::KRModbusSlave(Stream &theSerial, KRRegisters &registers, uint8_t addr_){
  serial = &theSerial;
  regs = &registers;
  addr=addr_;
  waitRespTime=10;
  tmReadTimeout=100;  
}

void KRModbusSlave::setWaitRespTime(uint32_t value){waitRespTime=value;}
void KRModbusSlave::setReadTimeout(uint32_t value){tmReadTimeout=value;}
void KRModbusSlave::_DO(){}

#endif // KRMODBUSSLAVE_H_
