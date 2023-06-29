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
extern uint8_t MediumFontRus[];                                        // Подключаем шрифт MediumFontRus.
                                                                       // Если Вы не используете Кириллицу, то лучше подключить шрифт MediumFont, он займет меньше места в памяти программ.
void setup(){                                                          //
    myOLED.begin();                                                    // Инициируем работу с дисплеем.
    myOLED.setFont(MediumFontRus);                                     // Указываем шрифт который требуется использовать для вывода цифр и текста.
}                                                                      //
                                                                       //
void loop(){                                                           //
    myOLED.bgText(false);                                              // Указываем что у текста нет фона.
    myOLED.clrScr();                                                   // Чистим экран.
    myOLED.print("arduino", 0, 32);                                    // Выводим текст начиная с координаты 0x32.
    myOLED.print("arduino", 5, 39);                                    // Выводим текст начиная с координаты 0x39. Этот текст частично наложится на предыдущий, но не закрасит его.
    delay(5000);                                                       // 
    myOLED.bgText(true);                                               // Указываем что у текста есть фон (по умолчанию).
    myOLED.clrScr();                                                   // Чистим экран.
    myOLED.print("arduino", 0, 32);                                    // Выводим текст начиная с координаты 0x32.
    myOLED.print("arduino", 5, 39);                                    // Выводим текст начиная с координаты 0x39. Этот текст частично наложится на предыдущий, и закрасит его своим чёрным фоном.
    delay(5000);                                                       // 
}                                                                      //
