import 'package:flutter/material.dart';

final Color primaryColor =
    Color(0xFF4CAF50); // Verde para el encabezado y detalles
final Color listTileColor =
    Color(0xFFE8F5E9); // Verde claro para el fondo de los ListTiles
final Color selectedTileColor =
    Color(0xFFC8E6C9); // Verde más oscuro para el ítem seleccionado
final Color detailBackgroundColor =
    Color(0xFFF1F8E9); // Color de fondo para los detalles

ThemeData themeData = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  listTileTheme: ListTileThemeData(
    tileColor: listTileColor,
    selectedTileColor: selectedTileColor,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.black87),
  ),
);
