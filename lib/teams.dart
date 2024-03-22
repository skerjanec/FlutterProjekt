import 'package:flutter/material.dart';
import 'newTeam.dart';
import 'drawer.dart';

class TeamsPage extends StatefulWidget {
  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {

  List<String> items = List.generate(20, (index) => 'Item $index');
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
              Text(
                'EKIPE',
                textAlign: TextAlign.center, // Center text horizontally
                style: TextStyle(
                  fontSize: 48.0, // Set font size to 48
                  //fontWeight: FontWeight.bold, // Make text bold
                  color: Color.fromARGB(255, 117, 116, 116), // Set text color to white
                ),  
              ), 
              Expanded(
                child: ListView.builder(
                  //controller: _controller,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          // Handle item tap
                          print('Tapped on ${items[index]}');
                        },
                        child: ListTile(
                          title: Text(
                            items[index],
                            textAlign: TextAlign.center
                          ),
                        ),
                      );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: (){
                    // TO DO ustaveri ekipo SCREEN GOES HERE
                    print('to ustvari ekipo screen');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewTeamPage()),
                    );
                  },
                  child: Text(
                    'Ustvari novo ekipo',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ) 
            ],
          ),
        ),
      ),
      endDrawer: CustomDrawer(),

    );
  }


}
