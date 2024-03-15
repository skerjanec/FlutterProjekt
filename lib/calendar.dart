import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'dart:collection';


import 'package:date_field/date_field.dart';
import 'package:intl/date_symbol_data_local.dart';


/// KOLEDAR!!!
class Event {
  final String title;
  final DateTime time;

  const Event(this.title, this.time);

  @override
  String toString() => '$title - ${_formatTime(time)}';

  String _formatTime(DateTime time) {
    String hour = time.hour.toString().padLeft(2, '0'); // Ensure two digits with leading zeros
    String minute = time.minute.toString().padLeft(2, '0'); // Ensure two digits with leading zeros
    return '$hour:$minute';  
  }
}


class CustomTableCalendar extends StatefulWidget {
  @override
  _CustomTableCalendarState createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  CalendarFormat _calendarFormat= CalendarFormat.week;
  late Map<DateTime, List> _eventsList = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  void readEventsDatabase(){
    print("READ DATABASE_______________________");
    DateTime d = DateTime.now();
    DateTime date = DateTime(d.year,d.month,d.day,d.hour,d.minute);
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
    _focusedDay = DateTime.now();
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
      print("GET EVDENT FOR DAY :::::::::::::::::::::::::::::::::");
      return _eventsList.entries
          .where((entry) =>
              entry.key.year == day.year &&
              entry.key.month == day.month &&
              entry.key.day == day.day)
          .expand((entry) => entry.value.map((e)=>Event(e, entry.key)))
          .toList();
    }

    // TO DO - add - to database 
    void addEvent(DateTime day, bool weekly, String name){
      print("ADD EVENT FUNCTION________________________________________");
      if(weekly){
          //TO DO - event vpiše do konca sezone isti dan 
          // spremeni isBEFORE da ma - end date
        DateTime eventDate = day;
        for (int i = 0; i < 52 || eventDate.isBefore(DateTime.now().add(Duration(days: 30))); i++) {
          eventDate = day.add(Duration(days: i * 7));
          if (_eventsList == null || _eventsList[eventDate] == null || _eventsList[eventDate]!.isEmpty) _eventsList[eventDate] = [name];
          else _eventsList[eventDate]!.add(name);
        }
      }
      else{
        print(_eventsList[day]);
        if (_eventsList == null || _eventsList[day] == null || _eventsList[day]!.isEmpty) _eventsList[day] = [name];
        else _eventsList[day]!.add(name); // ! je tm če null, ??
        print(_eventsList[day]);
      }
    }
    // TO DO - remove from database
    void removeEvent(DateTime day, String name){

    }

    void updateCalendar(DateTime day){
      setState(() {
        _selectedDay = day;
        _focusedDay = day;
      });
    }
    return Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.utc(2050, 12, 31),
            focusedDay: _focusedDay,
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



            showDialog(
              context: context,
              builder: (BuildContext context) {
                // Define a boolean variable to track the checkbox state
              DateTime? dayChosen = _selectedDay;
              bool weeklyRepeat = false;
              String eventName = "test";

                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                  return AlertDialog(
                    title: Text('Dodaj nov dogodek'),
                    content: Text('Ustvari nov dogodek.'),
                    actions: [
                      DateTimeFormField(
                        mode: DateTimeFieldPickerMode.dateAndTime,
                        decoration: const InputDecoration(
                          labelText: 'Datum dogodka',
                        ),
                        firstDate: DateTime.now().subtract(const Duration(days: 365)),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                        initialPickerDateTime: _selectedDay,
                        onChanged: (DateTime? value) {
                          dayChosen = value;
                        },
                      ),
                      CheckboxListTile(
                        title: Text('se ponavlja vsak teden'),
                        value: weeklyRepeat,
                        onChanged: (bool? value) {
                          print("on changedddddddddddddddddd");
                          setState(() {
                            print("set stateeeeeeeeeeeeeee");
                            weeklyRepeat = value!;
                          });
                        },
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Ime dogodka',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          eventName = _nameController.text;
                          print("ADDDD EVENTTTTTTTT");
                          addEvent(dayChosen!, weeklyRepeat, eventName);
                          Navigator.of(context).pop();
                          updateCalendar(dayChosen!);
                        },
                        child: Text('add event'),
                      ),
                    ],
                  );
                  }
                );
              }
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
        title: Text('Termini'),
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
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              initialPickerDateTime: DateTime.now(),
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
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              initialPickerDateTime: DateTime.now(),
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