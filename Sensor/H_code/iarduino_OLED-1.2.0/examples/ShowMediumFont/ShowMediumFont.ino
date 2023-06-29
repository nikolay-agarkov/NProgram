//  Раскомментируйте для программной реализации шины I2C:    //
//  #define pin_SW_SDA 3                                     // Назначение любого вывода Arduino для работы в качестве линии SDA программной шины I2C.
//  #define pin_SW_SCL 9                                     // Назначение любого вывода Arduino для работы в качестве линии SCL программной шины I2C.
//  Раскомментируйте для совместимости с большинством плат:  //
//  #include <Wire.h>                                        // Библиотека iarduino_OLED будет использовать методы и функции библиотеки Wire.
//  Ссылки для ознакомления:                                 //
//  Подробная информация о подключении модуля к шине I2C:    // http://wiki.iarduino.ru/page/i2c_connection/
//  Подробная информация о функциях и методах библиотеки:    // http://wiki.iarduino.ru/page/OLED_trema/
//  Библиотека  iarduino_OLED_txt (текстовая) экономит ОЗУ:  // http://iarduino.ru/file/341.html
//  Бибилиотека iarduino_OLED     (графическая):             // http://iarduino.ru/file/340.html
                                                             // 
#include <iarduino_OLED.h>                                   // Подключаем библиотеку iarduino_OLED.
iarduino_OLED myOLED(0x3C);                                  // Объявляем объект myOLED, указывая адрес дисплея на шине I2C: 0x3C или 0x3D.
                                                             //
extern uint8_t MediumFontRus[];                              // Подключаем шрифт MediumFontRus.
                                                             // Если Вы не используете Кириллицу, то лучше подключить шрифт MediumFont, он займет меньше места в памяти программ.
void setup(){                                                //
    myOLED.begin();                                          // Инициируем работу с дисплеем.
    myOLED.setFont(MediumFontRus);                           // Указываем шрифт который требуется использовать для вывода цифр и текста.
}                                                            //
                                                             //
void loop(){                                                 //
    myOLED.clrScr();                                         // Чистим экран.
    myOLED.print(F("iArduino"), 15,     39);                 // Выводим текст начиная с координаты 15x39.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print(F("ABC"),      0,      15);                 // Выводим текст начиная с координаты 0x15.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print(F("XYZ"),      92,     63);                 // Выводим текст начиная с координаты 92x63.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print(F("abc"),      92,     15);                 // Выводим текст начиная с координаты 92x15.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print(F("xyz"),      0,      63);                 // Выводим текст начиная с координаты 0x63.
    delay (5000);                                            // Ждём 5 секунд.
                                                             //
    myOLED.clrScr();                                         // Чистим экран.
    myOLED.print(F("iАрдуино"), OLED_C, 39);                 // Выводим по центру, координата нижней части текста по оси Y равна 39. 
    delay (500);                                             // Ждём пол секунды.
    myOLED.print(F("АБВ"),      OLED_L, 15);                 // Выводим по левому  краю, координата нижней части текста по оси Y равна 15. 
    delay (500);                                             // Ждём пол секунды.
    myOLED.print(F("ЭЮЯ"),      OLED_R, 63);                 // Выводим по правому краю, координата нижней части текста по оси Y равна 63. 
    delay (500);                                             // Ждём пол секунды.
    myOLED.print(F("абв"),      OLED_R, 15);                 // Выводим по правому краю, координата нижней части текста по оси Y равна 15. 
    delay (500);                                             // Ждём пол секунды.
    myOLED.print(F("эюя"),      OLED_L, 63);                 // Выводим по левому  краю, координата нижней части текста по оси Y равна 63. 
    delay (5000);                                            // Ждём 5 секунд.
                                                             //
    myOLED.clrScr();                                         // Чистим экран.
    myOLED.print( 77, 0, 23);                                // Выводим число 77 начиная с координаты 0x23.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print( "+" );                                     // Выводим текст в той же строке сразу после предыдущего числа.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print( 77 );                                      // Выводим число 77 в той же строке сразу после предыдущего текста.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print( "=" );                                     // Выводим текст в той же строке сразу после предыдущего числа.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print( 77+77 );                                   // Выводим результат сложения чисел 77+77, в той же строке сразу после предыдущего текста.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print( 77, 0, 55, HEX );                          // Выводим число 77 начиная с координаты 0x55, вывод осуществляется в 16-ричной системе.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print( "+" );                                     // Выводим текст в той же строке сразу после предыдущего числа.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print( 77, OLED_N, OLED_N, HEX );                 // Выводим число 77 в той же строке сразу после предыдущего текста, вывод осуществляется в 16-ричной системе.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print( "=" );                                     // Выводим текст в той же строке сразу после предыдущего числа.
    delay (500);                                             // Ждём пол секунды.
    myOLED.print( 77+77, OLED_N, OLED_N, HEX );              // Выводим результат сложения чисел 77+77, в той же строке сразу после предыдущего текста, вывод осуществляется в 16-ричной системе.
    delay (5000);                                            // Ждём 5 секунд.
                                                             //
    myOLED.clrScr();                                         // Чистим экран.
    myOLED.print(F("{}[]()<>?!" ), OLED_C, 15);              // Выводим текст по центру, координата нижней части текста по оси Y равна 15. 
    myOLED.print(F("#$%&*~`'\"^"), OLED_C, 39);              // Выводим текст по центру, координата нижней части текста по оси Y равна 39. 
    myOLED.print(F("_-+=,.:;|/" ), OLED_C, 63);              // Выводим текст по центру, координата нижней части текста по оси Y равна 63. 
    delay (5000);                                            // Ждём 5 секунд.
}                                                            //