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
  case 1:
    return wd_value;
  case 2:
    return wd_value_kalib;
  case 3:
    return wd_value_proces;
  case 4:
    return wd_temperature; 
  }
}

void Data::write(uint16_t index, uint16_t value){
  uint32_t dw0;
  switch(index){
/*  case 0:
    dt=value;
    break;
  case 1:
    dt|=(uint32_t)value << 16;
    break;
  case 50:
    //wd_50=value;
    var_50=value;
    break;  
  case 51:
    //wd_51=value;
    var_51=value;
    break;  
  case 60:
    wd_60=value;
    break;  
  case 61:
    wd_61=value;
    break;  
  case 3:
    i=*(reinterpret_cast<int*>(&value));
    break;
  case 4:
    dw0=(*(reinterpret_cast<uint32_t*>(&flt)) & 0xffff0000) | value;
    flt=*(reinterpret_cast<float*>(&dw0)) ;
    break;
  case 5:
    dw0=(*(reinterpret_cast<uint32_t*>(&flt)) & 0x0000ffff) | ((uint32_t)value << 16);
    flt=*(reinterpret_cast<float*>(&dw0)) ;
    break;
  case 6:
    started=value;
    break;
  case 7:
    switch(value){
    case 1: 
      started=1;
      break;
    case 2: 
      started=0;
      break;
    case 3: 
      wd=0;
      i=0;
      flt=0;
      break;
    }
    break;
  case 8:
    bt0=value;
    break;
  case 9:
    bt1=value;
    break;
  case 10:
    opr=value;
    break;
  case 12:
    bt3=value;
    break;
  case 13:
    bt4=value;
    break;*/
  }
}

#endif // DATA_H_
