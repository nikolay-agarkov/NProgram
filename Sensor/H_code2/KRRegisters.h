/*

  Kandiral Ruslan
  http://kandiral.ru

  KRRegisters.h
  Ver.: 1.1
  http://kandiral.ru/arduino/modbus_slave_na_arduino.html
    
*/

#ifndef KRREGISTERS_H_
#define KRREGISTERS_H_

#if ARDUINO >= 100
#include <Arduino.h>
#else
#include <WProgram.h>
#endif

class KRRegisters{

  public:
    virtual uint16_t read(uint16_t index){return 0;}
    virtual void write(uint16_t index, uint16_t value){}

};

#endif // KRREGISTERS_H_
