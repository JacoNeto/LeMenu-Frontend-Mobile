import 'package:flutter/material.dart';

/*
This file contains the main colors of this application
*/

// function that create personalized material colors
MaterialColor _createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

// main custommed colors of the app
final colorC1 = _createMaterialColor(const Color(0xFFF20530));
final colorC2 = _createMaterialColor(const Color(0xFF0BD904));
final colorC3 = _createMaterialColor(const Color(0xFFBBBF45));
final colorC4 = _createMaterialColor(const Color(0xFFF20505));
final colorW1 = _createMaterialColor(const Color(0xFFC4C4C4));
final colorW2 = _createMaterialColor(const Color(0xFFF2F2F2));
final colorW3 = _createMaterialColor(const Color(0xFFFFF6F6));
