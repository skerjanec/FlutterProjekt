import 'package:flutter/material.dart';
import 'login.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: Text('Sprememba gesla'),
            onTap: () {
              // Handle item 1 tap
            },
          ),
          ListTile(
            title: Text('Odjava'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
            },
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}
