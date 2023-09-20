import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor =
      Color.fromARGB(255, 255, 255, 255); //73, 96, 249,

  static const Color titleColor = Color.fromARGB(255, 58, 58, 58);

  static const Color hintColor = Color.fromARGB(150, 255, 255, 255);
  static const Color fuchsiaColor = Color.fromARGB(255, 203, 62, 249);
  static const Color textColor = Color.fromARGB(255, 45, 153, 255);
  static const Color negativePointColor = Color.fromARGB(255, 165, 243, 255);

  static MaterialColor primarySwatch = createMaterialColor(primaryColor);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
