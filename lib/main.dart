import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './ui/page/home_screen.dart';
import './ui/page/login_screen.dart';

void main() => runApp(MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(titleTextStyle: GoogleFonts.roboto(fontSize: 80)),
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black)),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    ));
