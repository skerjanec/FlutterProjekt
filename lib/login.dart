import 'package:flutter/material.dart';
import 'forgottenPassword.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded( //expands over left space (so that align works)
              child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: (){
                    // TO DO FORGOT password SCREEN GOES HERE
                    print('to forgoten psw screen');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgottenPasswordPage()),
                    );
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // TO DO Perform login operation here
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    print('Username: $username');
                    print('Password: $password');
                  },
                  child: Text('Login'),
                ),
                ],),),
              Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: (){
                  // TO DO FORGOT Register SCREEN GOES HERE
                  print('to register screen');
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
