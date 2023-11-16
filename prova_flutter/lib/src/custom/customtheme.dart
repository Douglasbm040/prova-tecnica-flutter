import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      
    );
  }
}
