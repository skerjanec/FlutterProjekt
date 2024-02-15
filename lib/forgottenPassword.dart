import 'package:flutter/material.dart';


class ForgottenPasswordPage extends StatefulWidget {
  @override
  _ForgottenPasswordPageState createState() => _ForgottenPasswordPageState();
}

class _ForgottenPasswordPageState extends State<ForgottenPasswordPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _againEmailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pozabljeno geslo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _againEmailController,
              decoration: InputDecoration(
                labelText: 'ponovi e-mail',
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // TO DO register thingy
                String mail = _emailController.text;
                print('mail: $mail');
                print('Reset');
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('Na mail vam je bila poslana povezava'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Reset password'),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _againEmailController.dispose();
    super.dispose();
  }
}