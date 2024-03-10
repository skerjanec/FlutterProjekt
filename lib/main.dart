import 'package:flutter/material.dart';
import 'login.dart';
import 'teams.dart';
import 'calendar.dart';


import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await findSystemLocale();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 201, 196, 196), // Scaffold background color
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Color.fromARGB(255, 180, 174, 165)).copyWith(background: Colors.white),

      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the second page when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Go to login page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
            onPressed: () {
              // Navigate to the second page when the button is pressed
              Navigator.push(
                context,
                //MaterialPageRoute(builder: (context) => TeamsPage()),
                MaterialPageRoute(builder: (context) => CalendarPage()),
              );
            },
            child: Text('Go to Teams page'),
          ),
          ]
        ),
      )
    );
  }
}