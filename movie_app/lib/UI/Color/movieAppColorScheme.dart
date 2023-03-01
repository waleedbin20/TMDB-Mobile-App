import 'package:flutter/material.dart';

class WffColorScheme {
  static ColorScheme getColorScheme() {
    return const ColorScheme(
        primaryContainer: Color(0XFFBAD2C7),
        primary: Color(0xFF1F6C49),
        secondary: Color(0xFF173F35),
        background: Color.fromARGB(255, 180, 177, 177),
        surface: Color(0xFFFFFFFF),
        error: Color(0xFFB00020),
        onPrimary: Color(0xFF2E2A24),
        onSecondary: Color(0xFFFFFFFF),
        onBackground: Color(0xFF181100),
        onSurface: Color(0xFF2E2A24),
        onError: Color(0xFFFFFFFF),
        brightness: Brightness.light);
  }

  static const Color supportWarmGrey = Color(0xFF796E67);
  static const Color suportGreen = Color(0xFF458500);
  static const Color supportHeritageCream = Color(0xFFFFFFFF);
  static const Color supportGrey = Color(0xFFEDEDED);
  static const Color supportTrafficRed = Color(0xFFF14E23);
  static const Color supportTrafficHigh = Color(0xFFAC0F04);
  static const Color supportTrafficMed = Color(0xFFFBAE3B);
  static const Color supportTrafficLow = Color(0xFF91C848);
}
