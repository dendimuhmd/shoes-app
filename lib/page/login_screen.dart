import 'package:flutter/material.dart';
import 'package:shoes_app/page/home_screen.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void validate(context) {
    if (usernameController.text == '')
      throw ValidationException('Masukkan username');
    else if (passwordController.text == '')
      throw ValidationException('Masukkan password');
    else if (usernameController.text != 'dendi' ||
        passwordController.text != '1234')
      throw Exception('Login failed');
    else
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(30),
      child: Center(
        child: Wrap(
          runSpacing: 50,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Text('life on 4.0'),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 10,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Masukkan username...',
                      contentPadding: EdgeInsets.only(
                          left: 16, bottom: 10, top: 10, right: 16),
                      border: InputBorder.none),
                )),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 10,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Masukkan password...',
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 16, bottom: 10, top: 10, right: 16),
                      border: InputBorder.none),
                )),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder?>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      elevation: MaterialStateProperty.all(10),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xff0B0B0B))),
                  onPressed: () => validate(context),
                  child: Text('login')),
            )
          ],
        ),
      ),
    ));
  }
}

class ValidationException implements Exception {
  String message;
  ValidationException(this.message);
}
