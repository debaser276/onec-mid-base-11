Процедура ДополнитьФорму(Форма) Экспорт
	
	ИмяФормы = Форма.ИмяФормы;
	Если СтрЗаканчиваетсяНа(ИмяФормы, "ФормаДокумента") Тогда
		
		ДобавитьПолеКонтактноеЛицо(Форма);
		
		Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
			ДобавитьСогласованнаяСкидка(Форма);
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры 

Процедура ДобавитьПолеКонтактноеЛицо(Форма)
	
	ИмяДокумента = СтрРазделить(Форма.ИмяФормы, ".")[1];
		
	Если ИмяДокумента = "ЗаказПокупателя" Или 
		ИмяДокумента = "ПоступлениеТоваровУслуг" Или 
			ИмяДокумента = "РеализацияТоваровУслуг" Тогда
		ПолеКонтактноеЛицо = Форма.Элементы.Добавить("юб_КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ИначеЕсли ИмяДокумента = "ОплатаОтПокупателя" Тогда
		ПолеКонтактноеЛицо = Форма.Элементы.Вставить("юб_КонтактноеЛицо", Тип("ПолеФормы"),,Форма.Элементы.Основание);
	ИначеЕсли ИмяДокумента = "ОплатаПоставщику" Тогда
		ПолеКонтактноеЛицо = Форма.Элементы.Вставить("юб_КонтактноеЛицо", Тип("ПолеФормы"),,Форма.Элементы.СуммаДокумента);
	Иначе
		Возврат;
	КонецЕсли;
	
	ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
	ПолеКонтактноеЛицо.ПутьКДанным = "Объект.юб_КонтактноеЛицо";
	
	НоваяСвязь = Новый СвязьПараметраВыбора("Отбор.Владелец", "Объект.Контрагент");
	НовыйМассив = Новый Массив();
	НовыйМассив.Добавить(НоваяСвязь);
	НовыеСвязи = Новый ФиксированныйМассив(НовыйМассив);
	Форма.Элементы.юб_КонтактноеЛицо.СвязиПараметровВыбора = НовыеСвязи;
	
КонецПроцедуры 

Процедура ДобавитьСогласованнаяСкидка(Форма)
	
	ГруппаСкидка = Форма.Элементы.Добавить("ГруппаОбычная", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
	ГруппаСкидка.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаСкидка.Отображение = ОтображениеОбычнойГруппы.Нет;
	ГруппаСкидка.ОтображатьЗаголовок = ЛОЖЬ; 
	ГруппаСкидка.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда;
	
	ПолеСогласованнаяСкидка = Форма.Элементы.Добавить("юб_СогласованнаяСкидка", Тип("ПолеФормы"), ГруппаСкидка);
	ПолеСогласованнаяСкидка.Вид = ВидПоляФормы.ПолеВвода;
	ПолеСогласованнаяСкидка.ПутьКДанным = "Объект.юб_СогласованнаяСкидка";
	ПолеСогласованнаяСкидка.УстановитьДействие("ПриИзменении", "юб_СогласованнаяСкидкаПриИзменении");
	
	КомандаПересчитатьТаблицу = Форма.Команды.Добавить("юб_ПересчитатьТаблицу");
	КомандаПересчитатьТаблицу.Заголовок = "ПересчитатьТаблицу";
	КомандаПересчитатьТаблицу.Действие = "юб_ПересчитатьТаблицу";    
	
	КнопкаПересчитатьТаблицу = Форма.Элементы.Добавить("юб_ПересчитатьТаблицу", Тип("КнопкаФормы"), ГруппаСкидка);
	КнопкаПересчитатьТаблицу.ИмяКоманды = "юб_ПересчитатьТаблицу";
	КнопкаПересчитатьТаблицу.Отображение = ОтображениеКнопки.КартинкаИТекст;
	КнопкаПересчитатьТаблицу.Картинка = БиблиотекаКартинок.Перечитать;
		
КонецПроцедуры

  


























