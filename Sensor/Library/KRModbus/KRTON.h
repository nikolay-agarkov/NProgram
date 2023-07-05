/*

  Kandiral Ruslan
  http://kandiral.ru

  KRTON.h
  Ver.: 2.2
  http://kandiral.ru/arduino/tajmer_s_zaderzhkoj_vklyucheniya_ton_na_arduino.html
    
*/

#ifndef KRTON_H_
#define KRTON_H_

#if ARDUINO >= 100
#include <Arduino.h>
#else
#include <WProgram.h>
#endif

class KRTON{

  private:
    unsigned long st;
    unsigned long getET(){
      ET=millis()-st;
      return ET;
    }

  public:
    KRTON(){init(1000);}
    KRTON(unsigned long _PT){init(_PT);}
    unsigned long ET, PT;
    bool Q;
    bool IN;
    void init(unsigned long _PT){
      PT=_PT;
      IN=false;
      Q=false;
    }  
    bool _DO(bool _IN){
      if(_IN!=IN){
        IN=_IN;
        if(IN)st=millis();else ET=0;
      }
      Q=IN ? !(getET()<PT) : false;
      return Q;
    }
};

#endif // KRTON_H_