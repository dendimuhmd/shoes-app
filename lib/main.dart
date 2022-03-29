import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './page/home_screen.dart';
import './page/login_screen.dart';

void main() => runApp(MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black)),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    ));
