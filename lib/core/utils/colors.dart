// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  AppColors({
    this.primary = const Color(0xFF094EFF),
    required this.scaffold,
    required this.onSurface,
    this.grey = const Color(0xFFC4C0C0),
    this.lightSub = const Color(0xFF7C7C7C),
    this.black = const Color(0xFF101010),
    this.black2 = const Color(0xFF1E1E1E),
    required this.buttonOutline,
    this.success = const Color(0xFF008000),
    this.error = const Color(0xFFE83D1E),
    required this.surface,
    required this.formBackground,
  });
  final Color primary;
  final Color scaffold;
  final Color onSurface;
  final Color grey;
  final Color lightSub;
  final Color buttonOutline;
  final Color black;
  final Color black2;
  final Color success;
  final Color error;
  final Color surface;
  final Color formBackground;

  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      scaffold: Color.lerp(scaffold, other.scaffold, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      lightSub: Color.lerp(lightSub, other.lightSub, t)!,
      black: Color.lerp(black, other.black, t)!,
      black2: Color.lerp(black2, other.black2, t)!,
      buttonOutline: Color.lerp(buttonOutline, other.buttonOutline, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      formBackground: Color.lerp(formBackground, other.formBackground, t)!,
    );
  }

  @override
  AppColors copyWith({
    Color? primary,
    Color? scaffold,
    Color? onSurface,
    Color? grey,
    Color? lightSub,
    Color? buttonOutline,
    Color? black,
    Color? black2,
    Color? success,
    Color? error,
    Color? surface,
    Color? formBackground,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      scaffold: scaffold ?? this.scaffold,
      onSurface: onSurface ?? this.onSurface,
      grey: grey ?? this.grey,
      lightSub: lightSub ?? this.lightSub,
      buttonOutline: buttonOutline ?? this.buttonOutline,
      black: black ?? this.black,
      black2: black2 ?? this.black2,
      success: success ?? this.success,
      error: error ?? this.error,
      surface: surface ?? this.surface,
      formBackground: formBackground ?? this.formBackground,
    );
  }
}

AppColors get lightColors => AppColors(
      scaffold: Colors.white,
      onSurface: const Color(0xFF101010),
      buttonOutline: const Color(0xFF094EFF),
      surface: Colors.white,
      formBackground: const Color(0xFFf7f7f7),
    );

AppColors get darkColors => AppColors(
      scaffold: const Color(0xFF101010),
      onSurface: Colors.white,
      buttonOutline: Colors.white,
      surface: const Color.fromRGBO(255, 255, 255, 0.05),
      formBackground: const Color(0xFF262626),
    );

AppColors appColors(context) => Theme.of(context).extension<AppColors>()!;
