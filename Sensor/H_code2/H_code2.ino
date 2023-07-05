#include <OneWire.h>
OneWire ds(12); // Создаем объект OneWire для шины 1-Wire, с помощью которого будет осуществляться работа с датчиком

#include <EEPROM.h>
// <! Aдреса хранения !>
// 0 - мин. калибровка
// 2 - максимальная калибровка
// 4 - адрес устройства

#include <avr/pgmspace.h>
#include "GyverButton.h"
//Порт для подключения кнопки калибровки
#define BTN_PIN 3
GButton butt1(BTN_PIN);

// Инициализация дисплея
// Подключаем библиотеку iarduino_OLED.
#include <iarduino_OLED_txt.h>
// Объявляем объект myOLED, указывая адрес дисплея на шине I2C: 0x3C или 0x3D.
iarduino_OLED_txt myOLED;
extern uint8_t SmallFontRus[];
extern uint8_t MediumFontRus[];

//Подключение библиотеки KRModbusRTUSlave
#define TRANSMIT 2
#define ADDR_SLAVE 20

#define TRANS digitalWrite(TRANSMIT, HIGH)
#define RECIV digitalWrite(TRANSMIT, LOW)

#include "KRModbusRTUSlave.h"
#include "Data.h"



Data data_mb;
KRModbusRTUSlave mb(Serial,data_mb,ADDR_SLAVE);


//<<<!!! ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ !!!>>>
int min_value = 0;
int max_value = 1023;
unsigned long my_timer;
unsigned long my_timer2;
unsigned long period_time = (long)10 * 1000;
unsigned long time_limit = (long)40 * 1000;
int value = -1;
int value_kalib = -1;
byte value_proces = -1;
byte disp = 0;
bool dis = true;

word wd_value;
word wd_value_kalib;
word wd_value_proces;
word wd_temperature;

uint16_t AnalogMeasure() {
  uint16_t a0 = 0;
  uint16_t n  = 0;
#define PIN_1 10
#define PIN_2 11
#define PIN_ADC A0
  // Устанавливаем режим АЦП (на всякий случай)
  analogReference(DEFAULT);
  // Цикл из 10 измерений
  for ( int i = 0; i < 10; i++) {
    // Фаза 1
    digitalWrite(PIN_2, LOW);
    digitalWrite(PIN_1, HIGH);
    // Ничего не делаем, пропускаем миллисекунду
    delay(10);
    // Фаза 2 (меняем полярность на делителе)
    digitalWrite(PIN_1, LOW);
    digitalWrite(PIN_2, HIGH);
    uint16_t a = analogRead(PIN_ADC);
    // После пяти итераций цикла начинаем мерить среднее значение
    if ( i > 4 ) {
      a0 += a;
      n++;
    }
    delay(10);
  }
  // Отключаем делитель от питания
  digitalWrite(PIN_1, LOW);
  digitalWrite(PIN_2, LOW);
  // Вычисляем среднее значение АЦП
  a0 /= n;
  return (a0);
}


// Функция перезапуска
void(* resetFunc) (void) = 0;


void def_config() {
  // запись минимального значения калибровки
  EEPROM.put(0, 0);
  // запись максимального значения калибровки
  EEPROM.put(2, 1023);
  // запись максимального значения калибровки
  EEPROM.put(4, 1);

  //resetFunc();
}


void setup() {



  // чтение стандартных значений
  EEPROM.get(0, min_value);
  EEPROM.get(2, max_value);
  min_value = 0;
  max_value = 1023;
  // Инициируем работу с дисплеем.
  myOLED.begin();
  myOLED.setFont(SmallFontRus);
  myOLED.clrScr();
  myOLED.setCoding(TXT_UTF8);
  myOLED.print(F("Датчик влажности"), OLED_C, 3);
  myOLED.print(F("МСД-1"), OLED_C, 5);
  delay(5000);
  myOLED.clrScr();
  myOLED.setFont(SmallFontRus);
  myOLED.print ( F("<РЕЖИМ МОНИТОРИНГА>"), OLED_C, 0);
  myOLED.print ( F("Данные калибровки"), OLED_C, 5);

  Serial.begin(19200);

  pinMode (11, OUTPUT);
  pinMode (10, OUTPUT);
  pinMode (A0, INPUT);
  pinMode(3, INPUT_PULLUP);
  pinMode(13, INPUT);
  my_timer = millis();
  my_timer2 = millis();

  AnalogMeasure();


  // <<!!! НАСТРОЙКИ РЕЖИМА КНОПОК !!!>>>
  butt1.setDebounce(80);        // настройка антидребезга
  butt1.setTimeout(2000);        // настройка таймаута на удержание
  butt1.setClickTimeout(600);   // настройка таймаута между кликами
  // HIGH_PULL - кнопка подключена к GND, пин подтянут к VCC (BTN_PIN --- КНОПКА --- GND)
  // LOW_PULL  - кнопка подключена к VCC, пин подтянут к GND
  // по умолчанию стоит HIGH_PULL
  butt1.setType(HIGH_PULL);
  // NORM_OPEN - нормально-разомкнутая кнопка
  // NORM_CLOSE - нормально-замкнутая кнопка
  butt1.setDirection(NORM_OPEN);

  pinMode(TRANSMIT, OUTPUT);  
  RECIV;

}

void display_() {
  myOLED.clrScr();
  myOLED.setFont(SmallFontRus);
  myOLED.print ( F("<РЕЖИМ МОНИТОРИНГА>"), OLED_C, 0);
  myOLED.print ( F("Данные калибровки"), OLED_C, 5);
}

void loop() {
 byte data[2]; // Место для значения те 
 
 
 
  
  ds.reset(); // Начинаем взаимодействие со сброса всех предыдущих команд и параметров
  ds.write(0xCC); // Даем датчику DS18b20 команду пропустить поиск по адресу. В нашем случае только одно устрйоство 
  ds.write(0x44); // Даем датчику DS18b20 команду измерить температуру. Само значение температуры мы еще не получаем - датчик его положит во внутреннюю память
  delay(100); // Микросхема измеряет температуру, а мы ждем.  
  
  ds.reset(); // Теперь готовимся получить значение измеренной температуры
  ds.write(0xCC); 
  ds.write(0xBE); // Просим передать нам значение регистров со значением температуры
  // Получаем и считываем ответ
  data[0] = ds.read(); // Читаем младший байт значения температуры
  data[1] = ds.read(); // А теперь старший
  // Формируем итоговое значение: 
  //    - сперва "склеиваем" значение, 
  //    - затем умножаем его на коэффициент, соответсвующий разрешающей способности (для 12 бит по умолчанию - это 0,0625)
  float temperature =  ((data[1] << 8) | data[0]) * 0.0625;

  wd_temperature = (word)(temperature * 10);

  if (digitalRead(13) == HIGH) {
    def_config();
  }
  butt1.tick();
  // при нажатии на кнопку включается дисплей или меняется изображение дисплея
  if (butt1.isSingle()) {
    if (dis == false) {
      myOLED.display_on();
      dis = true;
      my_timer2 = millis();
    } else {
      my_timer2 = millis();
      if (disp != 2) {
        disp = disp + 1;
      } else {
        disp = 0;
      }
    }
  }

  if (millis() - my_timer2 >= time_limit) {
    my_timer2 = millis();
    myOLED.display_off();
    dis = false;
  }


  // проверка на удержание кнопки
  if (butt1.isHolded()) {

    myOLED.setFont(SmallFontRus);
    myOLED.clrScr();
    myOLED.print (F("<РЕЖИМ КАЛИБРОВКИ>"), OLED_C, 0);
    myOLED.print (F("1 клик мин.значения"), OLED_L, 2);
    myOLED.print (F("2й для макс.значения"), OLED_L, 4);
    myOLED.print (F("Удержание для выхода"), OLED_L, 6);


    Serial.println (F("<<< РЕЖИМ КАЛИБРОВКИ : >>>"));
    Serial.println (F("1 клик кнопки для установки минимального значения"));
    Serial.println (F("2 клика кнопки для установки максимального значения"));
    Serial.println (F("Долгое нажатие кнопки выходит из режима калибровки"));

    // нахождение в меню
    while (true) {
      butt1.tick();
      // проверка на один клик
      if (butt1.isSingle()) {
        min_value = AnalogMeasure();
        Serial.print (F("<< Калибровка минимального значения = >> "));
        Serial.println(min_value);
        display_();
        //ЗАПИСЬ EEPROM
        EEPROM.put(0, min_value);
        Serial.print (F("<< Данные EEPROM обновлены >> "));

        break;
      }
      if (butt1.isDouble()) {
        max_value = AnalogMeasure();
        Serial.print (F("<< Калибровка максимального значения = >> "));
        Serial.println(max_value);
        display_();
        //ЗАПИСЬ EEPROM
        EEPROM.put(2, max_value);
        Serial.print (F("<< Данные EEPROM обновлены >> "));
        break;
      }
      if (butt1.isHolded()) {
        Serial.print (F("<<  РЕЖИМ мониторинга >> "));
        display_();
        break;
      }
    }
  }



  if (millis() - my_timer >= period_time) {
    my_timer = millis();   // "сбросить" таймер
    value = AnalogMeasure();
    value_kalib = map(value, 0, 1023, min_value, max_value);
    value_proces = map(value_kalib, min_value, max_value, 0, 100);

    wd_value = (word)value;
    wd_value_kalib = (word)value_kalib;
    wd_value_proces = (word)value_proces;
    
    Serial.println ();


    // Отображение данных с датчика
    if (dis == true) {
      if (disp == 0) {
        // Отображение влажности в чистых показаниях
        myOLED.setFont(MediumFontRus);
        myOLED.print(F("             "), OLED_C, 3);
        myOLED.print(value_kalib, OLED_C, 3);

        //Отображение текущей настройки калибровки
        myOLED.setFont(SmallFontRus);
        myOLED.setCursor(20, 7);
        myOLED.print (min_value);
        myOLED.setCursor(50, 7);
        myOLED.print (F("< | >"));
        myOLED.setCursor(83, 7);
        myOLED.print (max_value);
      }
      else if (disp == 1) {
        //Отображение влажности в процентах
        myOLED.setFont(MediumFontRus);
        myOLED.print(F("             "), OLED_C, 3);
        myOLED.print(value_proces, OLED_C, 3);
        myOLED.setCursor(87, 3);
        myOLED.print(F("%"));

        //Отображение текущей настройки калибровки
        myOLED.setFont(SmallFontRus);
        myOLED.setCursor(20, 7);
        myOLED.print (min_value);
        myOLED.setCursor(50, 7);
        myOLED.print (F("< | >"));
        myOLED.setCursor(83, 7);
        myOLED.print (max_value);

      }
      else if (disp == 2) {
        //Отображение температуры
        myOLED.setFont(MediumFontRus);
        myOLED.print(F("             "), OLED_C, 3);
        myOLED.print(temperature, OLED_C, 3);
        myOLED.setCursor(87, 3);
        myOLED.print(F("C"));

        //Отображение текущей настройки калибровки
        myOLED.setFont(SmallFontRus);
        myOLED.setCursor(20, 7);
        myOLED.print (min_value);
        myOLED.setCursor(50, 7);
        myOLED.print (F("< | >"));
        myOLED.setCursor(83, 7);
        myOLED.print (max_value);
      }
    }
  }


    mb._DO();
    data_mb._DO();
  
}
