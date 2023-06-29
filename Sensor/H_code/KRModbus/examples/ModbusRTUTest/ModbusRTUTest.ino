/*

  Kandiral Ruslan
  http://kandiral.ru

  Modbus Tester
  http://kandiral.ru/arduino/modbus_slave_na_arduino.html
    
*/

#include "Data.h"
#include <KRModbusRTUSlave.h>
#include <KRTON.h>

Data data;
KRModbusRTUSlave mb(Serial,data,1);
KRTON ton(500);

void setup() {
  Serial.begin(9600);  
}

void loop() {
  mb._DO();
  if(ton._DO(true)){
    ton._DO(false);
    data.next();
  }
}
