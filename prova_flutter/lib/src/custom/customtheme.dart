import 'package:flutter/material.dart';

class CustomTheme {
  static const List<Color> gradientColorBackground = [
    ///Color(0XFF093637),
    Color(0xFF214C5D),
    Color(0xFF2B8E89),
    //Color(0XFF44A08D)
  ];
  static ThemeData getTheme() {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          background: Colors.white,
          error: Colors.red,
        ),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            backgroundColor: const Color(0xFF43BD6E), //!
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        ),
        textTheme: TextTheme(
            labelSmall: TextStyle(
                color: Colors.red[800],
                fontSize: 12,
                fontWeight: FontWeight.bold),
            labelLarge: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            labelMedium: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300)),
        scaffoldBackgroundColor: const Color.fromARGB(0, 61, 58, 58));
  }
}
