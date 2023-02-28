import 'package:flutter/material.dart';
import 'package:movie_app/UI/Color/movieAppColorScheme.dart';

ThemeData themeData = ThemeData(
  colorScheme: WffColorScheme.getColorScheme(),
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
);
