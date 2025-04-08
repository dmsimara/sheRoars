import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.kronaOne(
    color: Colors.black87,
    fontSize: 31,    
    fontWeight: FontWeight.w500,
    ),
    headlineSmall: GoogleFonts.kronaOne(
      color: Colors.black87,
      fontSize: 20,    
      fontWeight: FontWeight.w500,
    ),
  );
}
