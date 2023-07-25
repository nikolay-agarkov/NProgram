/*

  Kandiral Ruslan
  http://kandiral.ru

  Modbus Tester
  https://kandiral.ru/delphi/mini_scada_sistema_na_delphi.html
    
*/

#ifndef DATA_H_
#define DATA_H_

#if ARDUINO >= 100
#include <Arduino.h>
#else
#include <WProgram.h>
#endif

#include "KRRegisters.h"
#include "KRTON.h"

extern word wd_value;
extern word wd_value_kalib;
extern word wd_value_proces;
extern word wd_temperature;
extern word wd_cmd;

class Data : public KRRegisters{

  public:
    KRTON _ton; 

    virtual uint16_t read(uint16_t index);
    virtual void write(uint16_t index, uint16_t value);

    void _DO(){
      if(_ton._DO(true)){
        _ton._DO(false);
      }
    }
    
};

uint16_t Data::read(uint16_t index){
  switch(index){
  case 50:
    return wd_value;
  case 51:
    return wd_value_kalib;
  case 52:
    return wd_value_proces;
  case 53:
    return wd_temperature; 
  case 54:
    return wd_cmd; 
  }
}

void Data::write(uint16_t index, uint16_t value){
  uint32_t dw0;
  switch(index){
  case 50:
    wd_value=value;
    break;
  case 51:
    wd_value_kalib=value;
    break;
  case 52:
    wd_value_proces=value;
    break;
  case 53:
    wd_temperature=value;
    break;
  case 54:
    wd_cmd=value;
    break;
  }
}

#endif // DATA_H_
