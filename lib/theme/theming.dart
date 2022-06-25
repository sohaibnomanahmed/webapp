import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Theming {
  // colors - make tints at https://maketintsandshades.com
  static const Color _primary = Color(0xFF6C67FF); // #6D67FF
  static const Color _primaryLight = Color(0xFF8985FF);
  static const Color _primaryDark = Color(0xFF5652CC);

  static const Color _bgcolorDark = Color(0xFF19182C);
  static const Color _secondaryDark = Color(0xFF242339);
  static const Color _iconDark = Color(0xFF363740);

  // default values
  static const double defaultElevation = 0;

  // font
  static const textTheme = GoogleFonts.ralewayTextTheme;

  // appBar
  static const appBarTheme = AppBarTheme(
    foregroundColor: _primaryDark,
    elevation: defaultElevation,
    backgroundColor: Colors.transparent,
  );

  // buttons
  static final elevetedButtonTheme = ElevatedButtonThemeData(
      style: TextButton.styleFrom(elevation: defaultElevation));

  static const floatingActionButtonTheme = FloatingActionButtonThemeData(
    elevation: defaultElevation,
    disabledElevation: defaultElevation,
    highlightElevation: defaultElevation,
  );

  // input decoration for textfield etc..
  static const inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    filled: true,
    isDense: true,
  );

  static const iconTheme = IconThemeData(color: _primary);

  // themes
  static final lightTheme = ThemeData(
    primaryColor: _primary,
    colorScheme: const ColorScheme.light().copyWith(
      primary: _primary,
      secondary: _primaryLight,
    ),
    elevatedButtonTheme: elevetedButtonTheme,
    floatingActionButtonTheme: floatingActionButtonTheme,
    inputDecorationTheme: inputDecorationTheme,
    textTheme: textTheme(),
    appBarTheme: appBarTheme,
    iconTheme: iconTheme,
  );

  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: _primary,
    colorScheme: const ColorScheme.dark()
        .copyWith(primary: _primary, secondary: _primaryLight),
    elevatedButtonTheme: elevetedButtonTheme,
    floatingActionButtonTheme: floatingActionButtonTheme,
    inputDecorationTheme: inputDecorationTheme,
    textTheme: textTheme(ThemeData(brightness: Brightness.dark).textTheme),
    appBarTheme: appBarTheme,
    iconTheme: iconTheme,
    scaffoldBackgroundColor: _bgcolorDark,
    canvasColor: _secondaryDark,
  );
}