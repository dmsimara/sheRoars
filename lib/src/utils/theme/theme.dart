import 'package:flutter/material.dart';
import 'package:to_yudi/src/utils/theme/widget_themes/text_theme.dart';

class TAppTheme {

  TAppTheme._();
  
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    textTheme: TTextTheme.lightTextTheme,
  );
}
