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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TO DO register thingy
                String mail = _emailController.text;
                print('mail: $mail');
                print('Reset');
              },
              child: Text('Reset password'),
            ),
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
