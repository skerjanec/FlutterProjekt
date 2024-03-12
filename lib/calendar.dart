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
  late Map<DateTime, List> _eventsList = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  void readEventsDatabase(){
    print("READ DATABASE_______________________");
    DateTime d = DateTime.now();
    DateTime date = DateTime(d.year,d.month,d.day);
    _eventsList[date.subtract(Duration(days: 2))] = ['Event A1', 'Event B1'];
    _eventsList[date] = ['Event E1', 'Event R1'];
  }

  @override
  void initState() {
    print("INIT STATA______________________________");
    super.initState();
    // TO DO - read from database to add events k se bojo dodal na koledar
    // pod team - Sezona - Termini
    // pomoje more pogledat, za koga kaže to če se nrdi za igralce
    _selectedDay = _focusedDay;
    readEventsDatabase();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD _________________________________________________");
    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);

    List getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }

    // TO DO - add - to database 
    void addEvent(DateTime day, bool weekly, String name){
      print("ADD EVENT FUNCTION________________________________________");
      print(_eventsList[day]);
      if (_eventsList == null || _eventsList[day] == null || _eventsList[day]!.isEmpty) _eventsList[day] = [name];
      else _eventsList[day]!.add(name); // ! je tm če null, ??
      print(_eventsList[day]);
      this.build(context);
    }
    // TO DO - remove from database
    void removeEvent(DateTime day, String name){

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
          ),
          ElevatedButton(
            onPressed: () {
              // Dialog -> for adding new event
            TextEditingController _nameController = TextEditingController();

              DateTime? dayChosen;
              bool weeklyRepeat = false;
              String eventName = "test";

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Dodaj nov dogodek'),
                    content: Text('Here you can add event details.'),
                    actions: [
                      DateTimeFormField(
                        mode: DateTimeFieldPickerMode.date,
                        decoration: const InputDecoration(
                          labelText: 'Datum dogodka',
                        ),
                        firstDate: DateTime.now().subtract(const Duration(days: 10)),
                        lastDate: DateTime.now().add(const Duration(days: 40)),
                        initialPickerDateTime: DateTime.now().add(const Duration(days: 20)),
                        onChanged: (DateTime? value) {
                          dayChosen = value;
                        },
                      ),
                      CheckboxListTile(
                        title: Text('se ponavlja vsak teden'),
                        value: weeklyRepeat,
                        onChanged: (bool? value) {
                          setState(() {
                            weeklyRepeat = value!;
                          });
                        },
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          eventName = _nameController.text;
                          print("ADDDD EVENTTTTTTTT");
                          print(dayChosen);
                          print(weeklyRepeat);
                          print(eventName);
                          print(_eventsList);
                          addEvent(dayChosen!, weeklyRepeat, eventName);
                          Navigator.of(context).pop();
                        },
                        child: Text('add event'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('+'),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
            ),
          ),
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