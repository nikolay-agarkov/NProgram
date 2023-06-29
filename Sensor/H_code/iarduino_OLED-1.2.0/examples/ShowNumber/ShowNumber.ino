//  Раскомментируйте для программной реализации шины I2C:              //
//  #define pin_SW_SDA 3                                               // Назначение любого вывода Arduino для работы в качестве линии SDA программной шины I2C.
//  #define pin_SW_SCL 9                                               // Назначение любого вывода Arduino для работы в качестве линии SCL программной шины I2C.
//  Раскомментируйте для совместимости с большинством плат:            //
//  #include <Wire.h>                                                  // Библиотека iarduino_OLED будет использовать методы и функции библиотеки Wire.
//  Ссылки для ознакомления:                                           //
//  Подробная информация о подключении модуля к шине I2C:              // http://wiki.iarduino.ru/page/i2c_connection/
//  Подробная информация о функциях и методах библиотеки:              // http://wiki.iarduino.ru/page/OLED_trema/
//  Библиотека  iarduino_OLED_txt (текстовая) экономит ОЗУ:            // http://iarduino.ru/file/341.html
//  Бибилиотека iarduino_OLED     (графическая):                       // http://iarduino.ru/file/340.html
                                                                       // 
#include <iarduino_OLED.h>                                             // Подключаем библиотеку iarduino_OLED.
iarduino_OLED myOLED(0x3C);                                            // Объявляем объект myOLED, указывая адрес дисплея на шине I2C: 0x3C или 0x3D.
                                                                       //
extern uint8_t SmallFontRus[];                                         // Подключаем шрифт SmallFontRus.
                                                                       // Если Вы не используете Кириллицу, то лучше подключить шрифт SmallFont, он займет меньше места в памяти программ.
void setup(){                                                          //
    myOLED.begin();                                                    // Инициируем работу с дисплеем.
    myOLED.setFont(SmallFontRus);                                      // Указываем шрифт который требуется использовать для вывода цифр и текста.
                                                                       //
    myOLED.print( 123456789 , 0, 7 );                                  // Выводим целое положительное число начиная с координаты 0x0.
    myOLED.print(-123456789 , 0, 15);                                  // Выводим целое отрицательное число начиная с координаты 0x15.
    myOLED.print( 123456789 , 0, 23, HEX);                             // Выводим целое положительное число начиная с координаты 0x23, в 16-ричной системе счисления.
    myOLED.print( 123456789 , 0, 31, OCT);                             // Выводим целое положительное число начиная с координаты 0x31, в 8-ричной системе счисления.
    myOLED.print(-123.456789, 0, 39);                                  // Выводим число с плавающей точкой  начиная с координаты 0x39, по умолчанию отобразится 2 знака после запятой.
    myOLED.print( 123.456789, 0, 47, 3);                               // Выводим число с плавающей точкой  начиная с координаты 0x47, указывая 3 знака после запятой.
    myOLED.print( 123       , 0, 55, BIN);                             // Выводим целое положительное число начиная с координаты 0x55, в 2-ичной системе счисления.
    myOLED.print( 123       , 0, 63, 12);                              // Выводим целое положительное число начиная с координаты 0x63, в 12-ричной системе счисления.
}                                                                      //
                                                                       //
void loop(){}                                                          //
