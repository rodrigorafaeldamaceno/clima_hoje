import 'package:flutter/material.dart';

class Tema {
  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');

    return Color(int.parse('FF$hexCode', radix: 16)).withOpacity(1);
  }

  static Color colorFromRGB(String rbgColor) {
    int red = int.parse(rbgColor.split(',')[0]);
    int green = int.parse(rbgColor.split(',')[1]);
    int blue = int.parse(rbgColor.split(',')[2]);

    return Color.fromRGBO(red, green, blue, 1);
  }
}
