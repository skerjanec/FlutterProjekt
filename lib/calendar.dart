import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'dart:collection';


import 'package:date_field/date_field.dart';
import 'package:intl/date_symbol_data_local.dart';


/// KOLEDAR!!!

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

class CustomTableCalendar extends StatefulWidget {
  @override
  _CustomTableCalendarState createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  DateTime? _selectedDay;
  DateTime? _focusedDay;
  CalendarFormat _calendarFormat= CalendarFormat.week;
  Map<DateTime, List> _eventsList = {};



int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }


  @override
  void initState() {
    super.initState();
    // TO DO - read from database to add events k se bojo dodal na koledar
    // pod team - Sezona - Termini
    // pomoje more pogledat, za koga kaže to če se nrdi za igralce
    _selectedDay = _focusedDay;
    _eventsList = {
      DateTime.now().subtract(Duration(days: 2)): ['Event A1', 'Event B1'],
      DateTime.now(): ['Event A2', 'Event B2', 'Event C1', 'Event D1'],
      DateTime.now().add(Duration(days: 1)): ['Event A3'],
      DateTime.now().add(Duration(days: 3)):
          Set.from(['Event A4', 'Event A5', 'Event B4']).toList(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }

    return Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.utc(2050, 12, 31),
            focusedDay: DateTime.now(),
            eventLoader: getEventForDay,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              print(_events[selectedDay]);
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          ListView(
            shrinkWrap: true,
            children: getEventForDay(_focusedDay ?? DateTime.now())
                .map((event) => ListTile(
                      title: Text(event.toString()),
                    ))
                .toList(),
          )
        ],
      );
  }


}



/////// TESTNO 
class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  @override
  Widget build(BuildContext context) {
    DateTime? _selectedDateStart;
    DateTime? _selectedDateEnd;

    initializeDateFormatting();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pozabljeno geslo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            DateTimeFormField(
              mode: DateTimeFieldPickerMode.date,
              decoration: const InputDecoration(
                labelText: 'Datum začetka sezone',
              ),
              firstDate: DateTime.now().add(const Duration(days: 10)),
              lastDate: DateTime.now().add(const Duration(days: 40)),
              initialPickerDateTime: DateTime.now().add(const Duration(days: 20)),
              onChanged: (DateTime? value) {
                _selectedDateStart = value;
              },
            ),
            SizedBox(height: 20),
            DateTimeFormField(
              mode: DateTimeFieldPickerMode.date,
              decoration: const InputDecoration(
                labelText: 'Datum konca sezone',
              ),
              firstDate: DateTime.now().add(const Duration(days: 10)),
              lastDate: DateTime.now().add(const Duration(days: 40)),
              initialPickerDateTime: DateTime.now().add(const Duration(days: 20)),
              onChanged: (DateTime? value) {
                _selectedDateEnd = value;
              },
            ),                
            SizedBox(height: 20),
            CustomTableCalendar(),
          ]
        )
      )
    );
  }
}