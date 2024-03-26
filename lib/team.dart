import 'package:flutter/material.dart';
import 'newTeam.dart';
import 'drawer.dart';
import 'rules.dart';
import 'history.dart';
import 'drinks.dart';
import 'lineup.dart';

class TeamPage extends StatelessWidget {
  final int teamId;
  final bool admin;

  const TeamPage({required this.teamId, required this.admin});

  // TO DO - beri ekipe igrlaca iz baze

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text(teamId.toString()),
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Container(
          width: double.infinity, // Set container width to match the screen width
          height: double.infinity, // Set container height to match the screen height
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second page when the button is pressed
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TeamPage(teamId: teamId, admin: true),
                    )
                  );
                },
                child: Text('Prijava na termin'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second page when the button is pressed
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LineupPage(teamId: teamId, admin: true),
                    )
                  );
                },
                child: Text('Postava'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second page when the button is pressed
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DrinksPage(teamId: teamId, admin: true),
                    )
                  );
                },
                child: Text('Pjača'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second page when the button is pressed
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HistoryPage(teamId: teamId, admin: true),
                    )
                  );
                },
                child: Text('Zgodovina prijav'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second page when the button is pressed
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RulesPage(teamId: teamId, admin: true),
                    )
                  );
                },
                child: Text('Pravila'),
              ),
              Visibility(
                visible: admin,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the second page when the button is pressed
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TeamPage(teamId: teamId, admin: false),
                          )
                        );
                      },
                      child: Text('Igralci'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the second page when the button is pressed
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TeamPage(teamId: teamId, admin: false),
                          )
                        );
                      },
                      child: Text('Edit ekipo'),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
      endDrawer: CustomDrawer(),

    );
  }


}
