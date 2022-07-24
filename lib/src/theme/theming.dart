import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Theming {
  // colors - make tints at https://maketintsandshades.com
  final Color _primary = Colors.amber; // #6D67FF
  // static const Color _primaryLight = Color(0xFF8985FF);
  // static const Color _primaryDark = Color(0xFF5652CC);

  final Color _secondary = Colors.deepOrange; // #6D67FF
  // static const Color _secondaryLight = Color(0xFF8985FF);
  // static const Color _secondaryDark = Color(0xFF5652CC);

  final Color _bgcolorDark = const Color(0xFF19182C);
  final Color _secondaryDark = const Color(0xFF242339);
  // static const Color _iconDark = Color(0xFF363740);

  // static const Color _light = Color(0xFFF7F8FC);
  // static const Color _lightGray = Color(0xFFA4A6B3);
  // static const Color _darkGray = Color(0xFF363740);

  // default values
  final double defaultElevation = 0;

  // font
  final textTheme = GoogleFonts.ralewayTextTheme;

  // appBar
  final appBarTheme = AppBarTheme(
    //foregroundColor: _primaryDark, # text, icons etc..
    elevation: defaultElevation,
    //backgroundColor: Colors.transparent,
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
    colorScheme: const ColorScheme.light().copyWith(
      primary: _primary,
      secondary: _secondary,
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
        .copyWith(primary: _primary, secondary: _secondary),
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
