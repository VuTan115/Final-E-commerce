import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_booking_application/app/utils/media.dart';

final theme = ThemeData(
  brightness: Brightness.light,
  accentColorBrightness: Brightness.light,
  primaryColorBrightness: Brightness.light,
  textTheme: GoogleFonts.openSansTextTheme(),
  primaryColorDark: const Color(0xFF0097A7),
  primaryColorLight: const Color(0xFFB2EBF2),
  primaryColor: const Color(0xFF00BCD4),
  accentColor: const Color(0xFF2A7C9F),
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: const Color(0xFFE0F2F1),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.Poppins,
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF00BCD4),
  primaryColorBrightness: Brightness.dark,
  accentColor: const Color(0xFF2A7C9F),
  accentColorBrightness: Brightness.dark,
);
