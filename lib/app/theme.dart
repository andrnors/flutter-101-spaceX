import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light() {
    final textTheme = _getTextTheme(brightness: Brightness.light);

    return ThemeData(
      primaryColor: _primaryColor,
      accentColor: _accentColor,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      dividerTheme: _dividerTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      appBarTheme: _appBarTheme,
    );
  }

  static ThemeData dark() {
    final textTheme = _getTextTheme(brightness: Brightness.dark);

    return ThemeData(
        brightness: Brightness.dark,
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        textTheme: textTheme,
        primaryTextTheme: textTheme,
        dividerTheme: _dividerTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        appBarTheme: _appBarTheme);
  }

  static const _primaryColor = Colors.black;
  static const _accentColor = Colors.white;
  static const _secondaryColor = Colors.orange;

  static const _dividerTheme = DividerThemeData(
    indent: 16.0,
    space: 0.0,
  );

  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: _secondaryColor,
      onPrimary: _primaryColor,
    ),
  );

  static final _appBarTheme = AppBarTheme(
    backgroundColor: _primaryColor,
    brightness: Brightness.dark,
  );

  static _getTextTheme({required Brightness brightness}) {
    final themeData = ThemeData(brightness: brightness);

    return GoogleFonts.exo2TextTheme(themeData.textTheme).copyWith(
      headline1: GoogleFonts.cairo(),
      headline2: GoogleFonts.cairo(),
      headline3: GoogleFonts.cairo(),
      headline4: GoogleFonts.cairo(),
      headline5: GoogleFonts.cairo(),
      headline6: GoogleFonts.cairo(),
      bodyText1: GoogleFonts.cairo(),
      bodyText2: GoogleFonts.cairo(),
    );
  }
}
