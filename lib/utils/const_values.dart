import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Globals {
  static Color primary_1 = Colors.yellow.shade800;
  static Color primary_2 = const Color(0xFF7F5A83);
  static Color text_color = Colors.white;

  static ThemeData themeData = ThemeData.dark().copyWith(
      textTheme: GoogleFonts.ptSansTextTheme(),
      primaryColor: primary_1,
      inputDecorationTheme: inputDecorationTheme,
      textButtonTheme: buttonTheme,
      colorScheme: ColorScheme.dark().copyWith(primary: primary_1));

  static InputDecorationTheme inputDecorationTheme =
      const InputDecorationTheme().copyWith(
    border: InputBorder.none,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        )),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    filled: true,
    focusColor: primary_1,
  );

  static TextButtonThemeData buttonTheme = TextButtonThemeData(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(Size(100, 40)),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
          foregroundColor: MaterialStateProperty.all<Color>(text_color),
          backgroundColor: MaterialStateProperty.all<Color>(primary_1)));

  static TextStyle headerText = const TextStyle(
      fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);

  static BoxDecoration backgroundGradient = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Globals.primary_1, Globals.primary_2]));
}
