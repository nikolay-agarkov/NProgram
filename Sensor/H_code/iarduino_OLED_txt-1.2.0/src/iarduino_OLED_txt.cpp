#include "iarduino_OLED_txt.h"																							//
																														//
//		Инициализация дисплея:																							//	Возвращаемое значение: отсутствует
void	iarduino_OLED_txt::begin(void){																					//	Параметр: отсутствует
//			Инициируем работу с шиной I2C:																				//
			objI2C->begin(100);																							//	Инициируем передачу данных по шине I2C на скорости 100 кГц.
//			Подготавливаем к работе дисплей:																			//	
			_sendCommand(SSD1306_DISPLAY_OFF);																			//	Выключаем дисплей.
			_sendCommand(SSD1306_SET_DISPLAY_CLOCK);	_sendCommand(0x80);												//	Устанавливаем частоту обновления дисплея в значение 0x80 (по умолчанию).
			_sendCommand(SSD1306_SET_MULTIPLEX_RATIO);	_sendCommand(0x3F);												//	Устанавливаем multiplex ratio (коэффициент мультиплексирования COM выводов) в значение 0x3F (по умолчанию).
			_sendCommand(SSD1306_SET_DISPLAY_OFFSET);	_sendCommand(0x00);												//	Устанавливаем смещение дисплея в 0 (без смещения).
			_sendCommand(SSD1306_SET_START_LINE|0);																		//	Устанавливаем смещение ОЗУ в значение 0 (без смещения).
			_sendCommand(SSD1306_CHARGE_DCDC_PUMP);		_sendCommand(0x14);												//	Настраиваем схему питания (0x14 - включить внутренний DC-DC преобразователь, 0x10 - отключить внутренний DC/DC).
			_sendCommand(SSD1306_ADDR_MODE);			_sendCommand(0x00);												//	Устанавливаем режим автоматической адресации (0x00-горизонтальная, 0x01-вертикальная, 0x10-страничная.)
			_sendCommand(SSD1306_SET_REMAP_L_TO_R);																		//	Устанавливаем режим строчной развертки (слева/направо).
			_sendCommand(SSD1306_SET_REMAP_T_TO_D);																		//	Устанавливаем режим кадровой развертки (сверху/вниз).
			_sendCommand(SSD1306_SET_COM_PINS);			_sendCommand(0x12);												//	Устанавливаем аппаратную конфигурация COM выводов в значение 0x12 (по умолчанию)
			_sendCommand(SSD1306_SET_CONTRAST);			_sendCommand(0xCF);												//	Устанавливаем контрастность в значение 0xCF (допустимы значения от 0x00 до 0xFF).
			_sendCommand(SSD1306_SET_PRECHARGE_PERIOD);	_sendCommand(0xF1);												//	Настраиваем схему DC/DC преобразователя (0xF1 - Vcc снимается с DC/DC преобразователя, 0x22 - Vcc подается извне).
			_sendCommand(SSD1306_SET_VCOM_DESELECT);	_sendCommand(0x40);												//	Устанавливаем питание светодиодов VcomH в значение выше чем по умолчанию (0x30), что увеличит яркость дисплея (допустимые значения: 0x00, 0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70).
			_sendCommand(SSD1306_RAM_ON);																				//	Разрешаем отображать содержимое RAM памяти.
			_sendCommand(SSD1306_INVERT_OFF);																			//	Отключаем инверсию.
			_sendCommand(SSD1306_DISPLAY_ON);																			//	Включаем дисплей.
			clrScr();																									//	Чистим экран.
}																														//
																														//
//		Включение и выключение дисплея:	
void iarduino_OLED_txt::display_off(void){
	_sendCommand(SSD1306_DISPLAY_OFF);	
}
void iarduino_OLED_txt::display_on(void){
	_sendCommand(SSD1306_DISPLAY_ON);	
}

//		Очистка дисплея:																								//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::clrScr(bool color){																			//	Параметр: флаг закрашивания экрана в белый цвет.
			uint8_t i[128];																								//	Создаём массив для закраски одной страницы.
			for(uint8_t j=0; j<128; j++){i[j]=color?0xFF:0x00;}															//	Устанавливаем все биты массива в 1 или 0, зависит от флага color.
			for(uint8_t j=0; j<  8; j++){																				//	Проходим по всем страницам дисплея.
				_sendCommand(SSD1306_ADDR_PAGE);																		//	Установка адреса страницы.
				_sendCommand(j);																						//	Начало.
				_sendCommand(j);																						//	Конец.
				_sendCommand(SSD1306_ADDR_COLUMN);																		//	Установка адреса колонки.
				_sendCommand(0);																						//	Начало - № первой колонки экрана.
				_sendCommand(127);																						//	Конец  - № последней колонки экрана.
				_sendData(i, 128);																						//	Отправляем массив i как данные для вывода на экран.
			}																											//
}																														//
																														//
//		Инверсия цвета дисплея:																							//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::invScr(bool invert){																			//	Параметр: флаг инвертирования - да/нет.
			if(invert)	{_sendCommand(SSD1306_INVERT_ON );}																//	Если флаг invert установлен - включаем инверсию.
			else		{_sendCommand(SSD1306_INVERT_OFF);}																//	Если флаг invert сброшен    - отключаем инверсию.
}																														//
																														//
//		Выбор шрифта для вывода текста:																					//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::setFont(uint8_t* font){																		//	Параметр:  название шрифта.
			insFont.font		=	font;																				//	Сохраняем указатель на первый байт массива в области памяти программ.
			insFont.width		=	pgm_read_byte(&font[0]);															//	Сохраняем ширину символов выбранного шрифта читая её  из 0 байта массива по указателю font.
			insFont.height		=	pgm_read_byte(&font[1]);															//	Сохраняем высоту символов выбранного шрифта читая её  из 1 байта массива по указателю font.
			insFont.firstSymbol	=	pgm_read_byte(&font[2]);															//	Сохраняем код первого симола выбран. шрифта читая его из 2 байта массива по указателю font.
			insFont.sumSymbol	=	pgm_read_byte(&font[3]);															//	Сохраняем количество символов в выбр шрифте читая их  из 3 байта массива по указателю font.
			insFont.setFont		=	true;																				//	Устанавливаем флаг выбора шрифта.
			uint16_t i			=	(uint16_t) insFont.sumSymbol * insFont.width * insFont.height / 8 + 0x04;			//	Определяем позицию бита указывающего количество пустых интервалов в массиве шрифта.
			uint16_t j			=	pgm_read_byte(&font[i]);															//	Определяем количество пустых интервалов в массиве шрифта.
									insFont.startSpace[0]=0xFF;	insFont.sumSpace[0]=0;									//	Указываем что первый пустой интервал в массиве шрифта находится после символа с кодом (0xFF) и состоит из 0 символов
									insFont.startSpace[1]=0xFF;	insFont.sumSpace[1]=0;									//	Указываем что второй пустой интервал в массиве шрифта находится после символа с кодом (0xFF) и состоит из 0 символов
									insFont.startSpace[2]=0xFF;	insFont.sumSpace[2]=0;									//	Указываем что третий пустой интервал в массиве шрифта находится после символа с кодом (0xFF) и состоит из 0 символов
			if(j>0)				{	insFont.startSpace[0]=pgm_read_byte(&font[i+1]);									//	Если количество пустых интервалов больше 0, то	сохраняем начало первого пустого интервала символов
									insFont.sumSpace  [0]=pgm_read_byte(&font[i+2]);}									//															и размер первого пустого интервала символов
			if(j>1)				{	insFont.startSpace[1]=pgm_read_byte(&font[i+3]);									//	Если количество пустых интервалов больше 1, то	сохраняем начало второго пустого интервала символов
									insFont.sumSpace  [1]=pgm_read_byte(&font[i+4]);}									//															и размер второго пустого интервала символов
			if(j>2)				{	insFont.startSpace[2]=pgm_read_byte(&font[i+5]);									//	Если количество пустых интервалов больше 2, то	сохраняем начало третьего пустого интервала символов
									insFont.sumSpace  [2]=pgm_read_byte(&font[i+6]);}									//															и размер третьего пустого интервала символов
}																														//
																														//
//		Установка курсора в указанную позицию																			//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::setCursor(int col, int str){																	//	Параметры: № колонки, № строки (страницы).
			if(col<128){numX=col;} if(str<8){numY=str;}																	//	Сохраняем указанные позиции курсора, если они входят в диапазон допустимых
}																														//
																														//
//		Вывод текста:																									//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::print(char* txt, int col, int str){															//	Параметры: текст, № колонки, № строки (страницы).
			_print(_codingCP866(txt), col, str);																		//	Вызываем функцию вывода текста _print().
}																														//
																														//
//		Вывод текста:																									//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::print(String txt, int col, int str){															//	Параметры: текст, № колонки, № строки (страницы).
			char i[txt.length()+1]; txt.toCharArray(i,txt.length()+1); _print(_codingCP866(i), col, str);				//	Преобразуем String в char* и вызываем функцию вывода текста _print().
}																														//
																														//
//		Вывод текста:																									//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::print(const char* txt, int col, int str){													//	Параметры: текст, № колонки, № строки (страницы).
			char i[strlen(txt)+1]; for(uint8_t j=0; j<=strlen(txt); j++){i[j]=txt[j];} _print(_codingCP866(i),col,str);	//	Преобразуем const char* в char* и вызываем функцию вывода текста _print().
}																														//
																														//
//		Вывод чисел:																									//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::print(int8_t num, int col, int str, uint8_t sys){											//	Параметры: число, № колонки, № строки (страницы), система счисления.
			print(int32_t(num), col, str, sys);																			//	Преобразуем int8_t в int32_t и вызываем функцию вывода числа print(int32_t).
}																														//
																														//
//		Вывод чисел:																									//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::print(uint8_t num, int col, int str, uint8_t sys){											//	Параметры: число, № колонки, № строки (страницы), система счисления.
			print(uint32_t(num), col, str, sys);																		//	Преобразуем uint8_t в uint32_t и вызываем функцию вывода числа print(uint32_t).
}																														//
																														//
//		Вывод чисел:																									//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::print(int16_t num, int col, int str, uint8_t sys){											//	Параметры: число, № колонки, № строки (страницы), система счисления.
			print(int32_t(num), col, str, sys);																			//	Преобразуем int16_t в int32_t и вызываем функцию вывода числа print(int32_t).
}																														//
																														//
//		Вывод чисел:																									//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::print(uint16_t num, int col, int str, uint8_t sys){											//	Параметры: число, № колонки, № строки (страницы), система счисления.
			print(uint32_t(num), col, str, sys);																		//	Преобразуем uint16_t в uint32_t и вызываем функцию вывода числа print(uint32_t).
}																														//
																														//
//		Вывод чисел:																									//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::print(int32_t num, int col, int str, uint8_t sys){											//	Параметры: число, № колонки, № строки (страницы), система счисления.
			int8_t i=2;          int32_t j=1;	while(num/j){j*=sys; i++;}												//	Определяем количество разрядов числа (i = количество разрядов + 2, j = множитель кратный основанию системы счисления)
			char k[i]; i--; k[i]=0; i--;		if(num>0) {k[i]=0; i--;}												//	Создаём строку k из i символов и добавляем символ(ы) конца строки.
			uint32_t n=num<0?num*-1:num;		while(i)  {k[i]=_ItoAa(n%sys); n/=sys; i--;}							//	Заполняем строку k.
												if(num>=0){k[i]=_ItoAa(n%sys);}else{k[i]='-';}							//	Добавляем первый символ (либо первая цифра, либо знак минус).
			print(k, col, str);																							//	Выводим строку k.
}																														//
																														//
//		Вывод чисел:																									//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::print(uint32_t num, int col, int str, uint8_t sys){											//	Параметры: число, № колонки, № строки (страницы), система счисления.
			int8_t i=1;          uint32_t j=1;	while(num/j){j*=sys; i++;} if(num==0){i++;}								//	Определяем количество разрядов числа (i = количество разрядов + 1, j = множитель кратный основанию системы счисления)
			char k[i]; i--; k[i]=0;				while(i){k[i-1]=_ItoAa(num%sys); num/=sys; i--;}						//	Определяем строку k из i символов и заполняем её.
			print(k, col, str);																							//	Выводим строку k.
}																														//
																														//
//		Вывод чисел:																									//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::print(double num, int col, int str, uint8_t sum){											//	Параметры: число, № колонки, № строки (страницы), количество знаков после запятой
			uint32_t i=1, j=0, k=0;																						//	Определяем временные переменные.
			j=sum; while(j){i*=10; j--;} 																				//	i=10^sum.
			print(int32_t(num), col, str);																				//	Выводим целую часть числа.
			if(sum){																									//	Если требуется вывести хоть один знак после запятой, то ...
				print(".");																								//	Выводим символ разделителя.
				j=num*i*(num<0?-1:1); j%=i; k=j;																		//	Получаем целое число, которое требуется вывести после запятой.
				if(j==0){while( sum  ){print("0"); sum--;}          }													//	Если полученное целое число = 0, то выводим sum раз символ 0.
				else    {while(j*10<i){print("0"); j*=10;} print(k);}													//	Иначе, если в полученном целом числе меньше разрядов чем требуется, то заполняем эти разряды выводя символ 0, после чего выводим само число.
			}
}																														//
																														//
//		Вывод текста:																									//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::_print(char* txt, int col, int str){															//	Параметры: текст, № колонки, № строки (страницы).
			if(insFont.setFont==false || insFont.height%8>0){return;}													//	Если шрифт не выбран или его высота не кратна 8 пикселям, то выходим из функции.
			uint16_t len=strlen(txt)*insFont.width; if(len>128){len=128/insFont.width*insFont.width;}					//	Определяем количество колонок которое занимают выводимые символы.
			uint16_t num;																								//	Объявляем переменную для хранения номера байта в массиве шрифта.
			switch(col){																								//	Колонка с которой требуется начать вывод текста ...
				case OLED_L: numX=0;			break;																	//	Определяем начальную колонку для выравнивания по левому краю.
				case OLED_C: numX=(128-len)/2;	break;																	//	Определяем начальную колонку для выравнивания по центру.
				case OLED_R: numX= 128-len;		break;																	//	Определяем начальную колонку для выравнивания по правому краю.
				case OLED_N: numX=numX;			break;																	//	Начальной колонкой останется та, на которой был закончен вывод предыдущего текста.
				default    : numX=col;			break;																	//	Начальная колонка определена пользователем.
			}																											//	
			switch(str){																								//	Строка с которой требуется начать вывод текста ...
				case OLED_T: numY=insFont.height/8-1;							break;									//	Определяем начальную строку для выравнивания по верхнему краю.
				case OLED_C: numY=(8-insFont.height/8)/2+insFont.height/8/2;	break;									//	Определяем начальную строку для выравнивания по центру.
				case OLED_B: numY=7;											break;									//	Определяем начальную строку для выравнивания по нижнему краю.
				case OLED_N: numY=numY;											break;									//	Начальной строкой останется та, на которой выведен предыдущий текст или изображение.
				default    : numY=str;											break;									//	Начальная строка определена пользователем.
			}																											//	
			if(numX+len>128){len=(128-numX)/insFont.width*insFont.width;}												//	Пересчитываем количество колонок которое занимают выводимые символы, с учётом начальной позиции.
			uint8_t  data[len];																							//	Объявляем массив для вывода данных.
			for(int8_t p=0; p<insFont.height/8; p++){																	//	Проходим по страницам символов...
				if( (int8_t) numY+p+1-(insFont.height/8) >=0 ){															//	Если страница символа находится в пределах страницы экрана, то ...
				if( (int8_t) numY+p+1-(insFont.height/8) <=7 ){															//	Если страница символа находится в пределах страницы экрана, то ...
					for(uint8_t n=0; n<(len/insFont.width); n++){														//	Проходим по выводимым символам...
						num  = uint8_t(txt[n]);																			//	Присваиваем переменной num код выводимого символа.
						if(insFont.startSpace[0]<num){num-=insFont.sumSpace[0];}										//	Если в массиве символов, до кода текущего символа, имеется пустой интервал, то уменьшаем код текущего символа на количество символов в пустом интервале.
						if(insFont.startSpace[1]<num){num-=insFont.sumSpace[1];}										//	Если в массиве символов, до кода текущего символа, имеется пустой интервал, то уменьшаем код текущего символа на количество символов в пустом интервале.
						if(insFont.startSpace[2]<num){num-=insFont.sumSpace[2];}										//	Если в массиве символов, до кода текущего символа, имеется пустой интервал, то уменьшаем код текущего символа на количество символов в пустом интервале.
						num -= insFont.firstSymbol;																		//	Вычитаем код первого символа (с которого начинается массив шрифта).
						num *= insFont.width;																			//	Умножаем полученное значение на ширину символа (количество колонок).
						num *= insFont.height/8;																		//	Умножаем полученное значение на высоту символа (количество страниц).
						num += p*insFont.width;																			//	Добавляем количество колонок данного символа, которые уже были выведены на предыдущих страницах.
						num += 0x04;																					//	Добавляем количество байт в начале массива шрифта, которые не являются байтами символов.
						for(uint8_t k=0; k<insFont.width; k++){															//	Проходим по колонкам (байтам) очередного символа.
							if(insFont.inverted)	{data[n*insFont.width+k]=~pgm_read_byte(&insFont.font[num+k]);}		//	Если установлен флаг инверсии текста, то считываем байт массива и инвертируем его
							else					{data[n*insFont.width+k]= pgm_read_byte(&insFont.font[num+k]);}		//	Иначе, если флаг инверсии не установлен, то считываем байт массива как есть.
						}																								//	
					}																									//	
					_sendCommand(SSD1306_ADDR_PAGE);																	//	Установка адреса страницы.
					_sendCommand(numY+p+1-(insFont.height/8));															//	Начало.
					_sendCommand(numY+p+1-(insFont.height/8));															//	Конец.
					_sendCommand(SSD1306_ADDR_COLUMN);																	//	Установка адреса колонки.
					_sendCommand(numX);																					//	Начало - № колонки экрана, с которой начинается вывод текста.
					_sendCommand(numX+len-1);																			//	Конец  - № колонки экрана, на которой заканчивается вывод текста.
					_sendData(data, len);																				//	Отправляем массив i как данные для вывода на экран.
				}}																										//	
			}		numX+=len;																							//	Сохраняем координату окончания текста.
}																														//
																														//
//		Преобразование одной цифры в один символ:																		//	Возвращаемое значение: символ.
char	iarduino_OLED_txt::_ItoAa(uint8_t num){																			//	Параметр: одна цифра от 0 до 15.
			return char( num + (num<10?48:55) );																		//	Преобразуем цифры 0-9 в символ с кодом 48-57, а цифры 10-15 в символ с кодом 65-71.
}																														//
																														//
//		Преобразование строки из кодировки UTF-8 в кодировку CP866:														//	Возвращаемое значение: строка в кодировке CP866.
char*	iarduino_OLED_txt::_codingCP866(char* StrIn){																	//	Параметр: строка в кодировке UTF-8.
			char*	StrOut=StrIn;																						//	Определяем строку для вывода результата.
			uint8_t	numIn    =	0,																						//	Определяем переменную хранящую номер символа в строке StrIn.
					numOut   =	0,																						//	Определяем переменную хранящую номер символа в строке StrOut.
					charThis =	StrIn[0],																				//	Определяем переменную хранящую код текущего символа в строке StrIn.
					charNext =	StrIn[1];																				//	Определяем переменную хранящую код следующего символа в строке StrIn.
			switch(codingName){																							//	Тип кодировки строки StrIn.
			//	Преобразуем текст из кодировки UTF-8:																	//
				case TXT_UTF8:																							//
					while (charThis> 0   &&numIn    <0xFF                ){												//	Если код текущего символа строки StrIn больше 0 и № текушего символа строки StrIn меньше 255, то ...
						if(charThis==0xD0&&charNext>=0x90&&charNext<=0xBF){StrOut[numOut]=charNext-0x10; numIn++;}else	//	Если код текущего символа равен 208, а за ним следует символ с кодом 144...191, значит это буква «А»...«п» требующая преобразования к коду 128...175
						if(charThis==0xD0&&charNext==0x81                ){StrOut[numOut]=         0xF0; numIn++;}else	//	Если код текущего символа равен 208, а за ним следует символ с кодом 129      , значит это буква «Ё»       требующая преобразования к коду 240
						if(charThis==0xD1&&charNext>=0x80&&charNext<=0x8F){StrOut[numOut]=charNext+0x60; numIn++;}else	//	Если код текущего символа равен 209, а за ним следует символ с кодом 128...143, значит это буква «р»...«я» требующая преобразования к коду 224...239
						if(charThis==0xD1&&charNext==0x91                ){StrOut[numOut]=         0xF1; numIn++;}else	//	Если код текущего символа равен 209, а за ним следует символ с кодом 145      , значит это буква «ё»       требующая преобразования к коду 241
						                                                  {StrOut[numOut]=charThis;}     numIn++;		//	Иначе не меняем символ.
						numOut++; charThis=StrIn[numIn]; charNext=StrIn[numIn+1];										//	Переходим к следующему символу.
					}	StrOut[numOut]='\0';																			//	Добавляем символ конца строки и возвращаем строку StrOut.
				break;																									//
			//	Преобразуем текст из кодировки WINDOWS-1251:															//
				case TXT_WIN1251:																						//
					while (charThis> 0   &&numIn    <0xFF){																//	Если код текущего символа строки StrIn больше 0 и № текушего символа строки StrIn меньше 255, то ...
						if(charThis>=0xC0&&charThis<=0xEF){StrOut[numOut]=charThis-0x40;}else							//	Если код текущего символа равен 192...239, значит это буква «А»...«п» требующая преобразования к коду 128...175
						if(charThis>=0xF0&&charThis<=0xFF){StrOut[numOut]=charThis-0x10;}else							//	Если код текущего символа равен 240...255, значит это буква «р»...«я» требующая преобразования к коду 224...239
						if(charThis==0xA8                ){StrOut[numOut]=         0xF0;}else							//	Если код текущего символа равен 168      , значит это буква «Ё»       требующая преобразования к коду 240
						if(charThis==0xB8                ){StrOut[numOut]=         0xF1;}else							//	Если код текущего символа равен 184      , значит это буква «ё»       требующая преобразования к коду 241
						                                  {StrOut[numOut]=charThis;}									//	Иначе не меняем символ.
						numIn++; numOut++; charThis=StrIn[numIn];														//	Переходим к следующему символу.
					}	StrOut[numOut]='\0';																			//	Добавляем символ конца строки и возвращаем строку StrOut.
				break;																									//
			}	return StrOut;																							//	Возвращаем строку StrOut.
}																														//
																														//
//		Отправка байта команды:																							//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::_sendCommand(uint8_t command){																//	Параметр: код команды.
			objI2C->writeByte(dispAddr, SSD1306_COMMAND, command);														//	Отправляем 3 байта: адрес dispAddr с битом rw=0 (запись), SSD1306_COMMAND, command.
}																														//
																														//
//		Отправка указанного количества байтов данных:																	//	Возвращаемое значение: отсутствует.
void	iarduino_OLED_txt::_sendData(uint8_t* data, uint8_t sum){														//	Параметры: указатель на начало массива данных, количество передаваемых байт
			if(objI2C->getType()==4){																					//	Если передача данных осуществляется под управлением библиотеки Wire.h, то ...
			for(uint8_t i=0; i<sum; i+=30){objI2C->writeBytes(dispAddr,SSD1306_DATA,&data[i],((i+30)<sum)?30:(sum-i));}}//	Передаём данные многобайтным пакетом, но не более 30 байт в одном пакете (ограничение буфера Wire.h)
			else                          {objI2C->writeBytes(dispAddr,SSD1306_DATA, data, sum);}						//	Передаём данные многобайтным пакетом не задумываясь о его размере.
}																														//