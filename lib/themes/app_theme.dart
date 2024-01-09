import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: const Color(0xFF00416A),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.black),
      bodyMedium: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
      bodySmall: TextStyle(fontSize: 14.0, color: Colors.black),
      displayLarge: TextStyle(fontSize: 12.0, color: Colors.grey),
      displayMedium: TextStyle(fontSize: 12.0, color: Colors.grey),
      displaySmall: TextStyle(fontSize: 12.0, color: Colors.grey),
      headlineLarge: TextStyle(fontSize: 12.0, color: Colors.grey),
      headlineMedium: TextStyle(fontSize: 12.0, color: Colors.grey),
      headlineSmall: TextStyle(fontSize: 12.0, color: Colors.grey),
      labelLarge: TextStyle(fontSize: 12.0, color: Colors.grey),
      labelMedium: TextStyle(fontSize: 12.0, color: Colors.grey),
      labelSmall: TextStyle(fontSize: 12.0, color: Colors.grey),
      titleLarge: TextStyle(fontSize: 12.0, color: Colors.grey),
      titleMedium: TextStyle(fontSize: 12.0, color: Colors.grey),
      titleSmall: TextStyle(fontSize: 12.0, color: Colors.grey),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      buttonColor: const Color(0xFF00416A),
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFAAC0CD)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF00416A)),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFF00416A);
        }
        return Colors.white;
      }),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00416A),
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}
