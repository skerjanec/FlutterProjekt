import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'teams.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 201, 196, 196), // Scaffold background color
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.orange).copyWith(background: Colors.white),

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
                MaterialPageRoute(builder: (context) => TeamsPage()),
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
