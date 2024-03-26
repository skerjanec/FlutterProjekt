import 'package:flutter/material.dart';
import 'drawer.dart';

class DrinksPage extends StatefulWidget {
  final int teamId;
  final bool admin;

  const DrinksPage({required this.teamId, required this.admin});

  @override
  _DrniksPageState createState() => _DrniksPageState();
}

class _DrniksPageState extends State<DrinksPage> {  
  TextEditingController _textEditingController = TextEditingController();
  bool _isEditing = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    bool admin = widget.admin;
    _textEditingController.text = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    return Scaffold(
      appBar: AppBar(
        title: Text('Pjača'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _textEditingController,
                      maxLines: null,
                      enabled: _isEditing,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: admin,
                child: Column(
                  children: [
                    ElevatedButton(
                       onPressed: () {
                        setState(() {
                          _isEditing = !_isEditing;
                          if (!_isEditing) {
                            // TO DO - Save or process the text when editing is finished
                            print('Text: ${_textEditingController.text}');
                          }
                        });
                      },
                      child: Text(_isEditing ? 'Zaključi z urejanjem' : 'Uredi'),
                    ),
                  ],
                )
              ),
          ],
        ),
      ),
      endDrawer: CustomDrawer(),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }


}