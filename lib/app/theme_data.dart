import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF4CAF50);
Color listTileColor = const Color(0xFFE8F5E9);
Color selectedTileColor = const Color(0xFFC8E6C9);
Color detailBackgroundColor = const Color(0xFFF1F8E9);

ThemeData themeData = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  listTileTheme: ListTileThemeData(
    tileColor: listTileColor,
    selectedTileColor: selectedTileColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
    bodyLarge: const TextStyle(color: Colors.black87),
  ),
);
