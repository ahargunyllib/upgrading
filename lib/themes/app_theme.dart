import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: const Color(0xFF00416A),
    scaffoldBackgroundColor: const Color(0xFF00416A),
    hoverColor: const Color(0xFF003658),
    
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF00416A)),
      bodyMedium: GoogleFonts.poppins(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF00416A)),
      bodySmall:
          GoogleFonts.poppins(fontSize: 14.0, color: const Color(0xFF00416A)),
      displayLarge:
          GoogleFonts.poppins(fontSize: 12.0, color: const Color(0xFF00416A)),
      displayMedium:
          GoogleFonts.poppins(fontSize: 12.0, color: const Color(0xFF00416A)),
      displaySmall:
          GoogleFonts.poppins(fontSize: 12.0, color: const Color(0xFF00416A)),
      headlineLarge:
          GoogleFonts.poppins(fontSize: 12.0, color: const Color(0xFF00416A)),
      headlineMedium:
          GoogleFonts.poppins(fontSize: 12.0, color: const Color(0xFF00416A)),
      headlineSmall:
          GoogleFonts.poppins(fontSize: 12.0, color: const Color(0xFF00416A)),
      labelLarge:
          GoogleFonts.poppins(fontSize: 12.0, color: const Color(0xFF00416A)),
      labelMedium:
          GoogleFonts.poppins(fontSize: 12.0, color: const Color(0xFF00416A)),
      labelSmall:
          GoogleFonts.poppins(fontSize: 12.0, color: const Color(0xFF00416A)),
      titleLarge:
          GoogleFonts.poppins(fontSize: 12.0, color: const Color(0xFF00416A)),
      titleMedium:
          GoogleFonts.poppins(fontSize: 12.0, color: const Color(0xFF00416A)),
      titleSmall:
          GoogleFonts.poppins(fontSize: 12.0, color: const Color(0xFF00416A)),
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
        borderSide: const BorderSide(color: Color(0xFF002035)),
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
