/*

  Kandiral Ruslan
  http://kandiral.ru

  Modbus Tester
  http://kandiral.ru/arduino/modbus_slave_na_arduino.html
    
*/

#include "Data.h"
#include <KRModbusRTUSlaveRS485UART0.h>
#include <KRTON.h>

Data data;
KRModbusRTUSlaveRS485 mb(data,2,1);
KRTON ton(500);

void setup() {
  mb.begin(115200);
}

void loop() {
  mb._DO();
  if(ton._DO(true)){
    ton._DO(false);
    data.next();
  }
}
