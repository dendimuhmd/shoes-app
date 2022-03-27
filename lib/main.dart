import 'package:flutter/material.dart';
import './page/home_screen.dart';
import './page/login_screen.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    ));
