import 'package:flutter/material.dart';
import 'calender.dart';


class NewTeamPage extends StatefulWidget {
  @override
  _NewTeamPageState createState() => _NewTeamPageState();
}

class _NewTeamPageState extends State<NewTeamPage> {
  TextEditingController _teamNameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  bool _isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ustvari ekipo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _teamNameController,
              decoration: InputDecoration(
                labelText: 'Ime',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Cena termina',
              ),
            ),
            SizedBox(height: 20),
            // TO DO - ADD CAL..
////////////////////////////////////////////////////////////////////////////////////////
            CustomTableCalendar(),
            SizedBox(height: 20),
            // TO DO - a implementiramo al ne? sam vsi majo to
            CheckboxListTile(
              title: Text('dodaj stran za pjačo'),
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // TO DO USTVARI EKIPO thingy
                String name = _teamNameController.text;
                print('ime: $name');
                print('Reset');
              },
              child: Text('Ustvari novo ekipo'),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _teamNameController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
