// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playground/modals/search_results_modal.dart';

class Globals {
  static Color primary_1 = const Color.fromARGB(255, 86, 131, 220);
  static Color primary_2 = const Color(0xFF7F5A83);
  static Color text_color = Colors.black;

  static ThemeData themeData = ThemeData.light().copyWith(
      textTheme: GoogleFonts.robotoTextTheme(),
      primaryColor: primary_1,
      inputDecorationTheme: inputDecorationTheme,
      textButtonTheme: buttonTheme,
      colorScheme: const ColorScheme.light().copyWith(primary: primary_1));

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
          minimumSize: MaterialStateProperty.all<Size>(const Size(100, 40)),
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

class MockData {
  static Product amazonCheap = Product(
      "Some product With a very long name that fits everywhere no matter how long the name is",
      "\$100",
      '',
      "https://api.lorem.space/image/watch?w=400&h=400&hash=7cq2y9cb",
      "4.5",
      "");
  static Product aliCheap = Product(
      "Some product With a very long name that fits everywhere no matter how long the name is 1",
      "\$54",
      '',
      "https://api.lorem.space/image/watch?w=400&h=400&hash=1ekfvz8c",
      "5.0",
      "");
  static Product ebayCheap = Product(
      "Some product With a very long name that fits everywhere no matter how long the name is 2",
      "\$84",
      '',
      "https://api.lorem.space/image/watch?w=400&h=400&hash=3c2wcvxh",
      "2.5",
      "");

  static List<Product> results() {
    List<Product> tmp = [];
    for (var i = 0; i < 10; i++) {
      tmp.add(Product(
          "Some random product from the web api bla bla $i",
          "\$134",
          'https://api.lorem.space/image/watch?w=400&h=400&hash=3c2wcvxh$i',
          'https://api.lorem.space/image/watch?w=400&h=400&hash=3c2wcvxh$i',
          "4.5",
          ""));
    }
    return tmp;
  }

  static List<SiteResult> resultss = [
    SiteResult("Amazon", amazonCheap, results()),
    SiteResult("Aliexpress", aliCheap, results()),
    SiteResult("Ebay", ebayCheap, results())
  ];
}
