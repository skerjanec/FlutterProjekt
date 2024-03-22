import 'package:flutter/material.dart';
import 'newTeam.dart';
import 'drawer.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {

  // TO DO - beri ekipe igrlaca iz baze

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Container(
          width: double.infinity, // Set container width to match the screen width
          height: double.infinity, // Set container height to match the screen height
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

            ],
          ),
        ),
      ),
      endDrawer: CustomDrawer(),

    );
  }


}
