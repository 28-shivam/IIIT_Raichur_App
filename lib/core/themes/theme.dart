import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/icon_button_theme.dart';
import 'custom_themes/icon_theme.dart';
import 'custom_themes/text_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    fontFamily: 'Poppins',
    iconTheme: FIconTheme.lightIconTheme,
    scaffoldBackgroundColor: const Color(0xFFF6F6F6),
    textTheme: FTextTheme.lightTextTheme,
    appBarTheme: FAppBarTheme.lightAppBarTheme,
    chipTheme: FChipTheme.lightChipTheme,
    elevatedButtonTheme: FElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: FTextFormFieldTheme.lightInputDecoration,
    textButtonTheme: FTextButtonTheme.lightTextButtonTheme,
    iconButtonTheme: FIconButtonTheme.lightIconButtonTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    fontFamily: 'Poppins',
    iconTheme: FIconTheme.darkIconTheme,
    scaffoldBackgroundColor: const Color(0xFF171B2C),
    textTheme: FTextTheme.darkTextTheme,
    elevatedButtonTheme: FElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: FAppBarTheme.darkAppBarTheme,
    chipTheme: FChipTheme.darkChipTheme,
    inputDecorationTheme: FTextFormFieldTheme.darkInputDecoration,
    textButtonTheme: FTextButtonTheme.darkTextButtonTheme,
    iconButtonTheme: FIconButtonTheme.darkIconButtonTheme,
  );
}

