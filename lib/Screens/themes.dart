// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placeta/Screens/themes.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        //themeMode: ThemeMode.light,
        //theme: ThemeData(primarySwatch: Colors.deepPurple),
        //darkTheme: ThemeData(brightness: Brightness.light),
      );

  final ThemeData  DarkTheme = ThemeData(
    brightness: Brightness.dark,
    // Add any other styles for the dark theme here
  );

  static darkTheme(BuildContext context) {}
}
