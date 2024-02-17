import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _againpasswordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
          padding: EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
            left: 50.0,
            right: 50.0,
          ),
        child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Ime',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _surnameController,
                decoration: InputDecoration(
                  labelText: 'Priimek',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Geslo',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _againpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Ponovi geslo',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Telefonska',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // TO DO register thingy
                  // v bazo
                  // check 
                  // - geslo=geslo
                  // - a je že kdo z mailom
                  String password = _passwordController.text;
                  print('Password: $password');
                  print('Register');
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _againpasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
