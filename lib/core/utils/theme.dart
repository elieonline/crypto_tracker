import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

TextTheme textTheme(context) => Theme.of(context).textTheme;

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      extensions: [lightColors],
      fontFamily: 'RosaSans',
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.transparent,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFF101010),
        elevation: 0,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Color(0xFF101010),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      extensions: [darkColors],
      fontFamily: 'RosaSans',
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFF101010),
        elevation: 0,
      ),
      buttonTheme: const ButtonThemeData(minWidth: 0),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF101010),
      canvasColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Color(0xFF101010),
        ),
      ),
    );
  }
}
