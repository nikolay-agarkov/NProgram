/*

  Kandiral Ruslan
  http://kandiral.ru

  Modbus Tester
  http://kandiral.ru/arduino/modbus_slave_na_arduino.html
    
*/

#ifndef DATA_H_
#define DATA_H_

#if ARDUINO >= 100
#include <Arduino.h>
#else
#include <WProgram.h>
#endif

#include <EEPROM.h>
#include <KRRegisters.h>

class Data : public KRRegisters{

  public:
    word wd=12340;
    int i=-5142;
    uint32_t dw=98765;
    long lng=-7531987;
    float flt=256.81245;
    byte str[8]={'T','e','x','t','1','2','3','\0'};
    word regs[4]={0,100,1000,10000};
    virtual uint16_t read(uint16_t index);
    virtual void write(uint16_t index, uint16_t value);

    void next(){
      wd+=1;
      i-=1;
      dw+=3;
      lng-=7;
      flt+=0.0123;
      regs[0]+=1;
      regs[1]+=2;
      regs[2]-=1;
      regs[3]-=2;
    }
    
};

uint16_t Data::read(uint16_t index){
  switch(index){
  case 0:
    return wd;
  case 1:
    return *(reinterpret_cast<uint16_t*>(&i));
  case 2:
    return dw;
  case 3:
    return dw >> 16;
  case 4:
    return *(reinterpret_cast<uint32_t*>(&lng));
  case 5:
    return *(reinterpret_cast<uint32_t*>(&lng)) >> 16;
  case 6:
    return *(reinterpret_cast<uint32_t*>(&flt));
  case 7:
    return *(reinterpret_cast<uint32_t*>(&flt)) >> 16;
  case 8:
  case 9:
  case 10:
  case 11:
    return ((uint16_t)str[(index-8)*2+1] << 8) | (uint16_t)str[(index-8)*2];
  case 12:
  case 13:
  case 14:
  case 15: return regs[index-12];  
  default:
    int n=(index-8)*2;
    uint16_t res=EEPROM.read(n++);
    res<<=8;
    return res|EEPROM.read(n);
  }
}

void Data::write(uint16_t index, uint16_t value){
  uint32_t dw0;
  switch(index){
  case 0:
    wd=value;
    break;
  case 1:
    i=*(reinterpret_cast<int*>(&value));
    break;
  case 2:
    dw=(dw & 0xffff0000) | value;
    break;
  case 3:
    dw=(dw & 0x0000ffff) | ((uint32_t)value << 16);
    break;
  case 4:
    dw0=(*(reinterpret_cast<uint32_t*>(&lng)) & 0xffff0000) | value;
    lng=*(reinterpret_cast<long*>(&dw0)) ;
    break;
  case 5:
    dw0=(*(reinterpret_cast<uint32_t*>(&lng)) & 0x0000ffff) | ((uint32_t)value << 16);
    lng=*(reinterpret_cast<long*>(&dw0)) ;
    break;
  case 6:
    dw0=(*(reinterpret_cast<uint32_t*>(&flt)) & 0xffff0000) | value;
    flt=*(reinterpret_cast<float*>(&dw0)) ;
    break;
  case 7:
    dw0=(*(reinterpret_cast<uint32_t*>(&flt)) & 0x0000ffff) | ((uint32_t)value << 16);
    flt=*(reinterpret_cast<float*>(&dw0)) ;
    break;
  case 8:
  case 9:
  case 10:
  case 11:
    str[(index-8)*2+1]=(value >> 8);
    str[(index-8)*2]=value;
    break;
  case 12:
  case 13:
  case 14:
  case 15: regs[index-12]=value;
  default:
    int n=(index-8)*2;
    EEPROM.write(n++,(value >> 8) & 0xFF);
    EEPROM.write(n,value & 0xFF);
  }
}

#endif // DATA_H_
