import 'package:crypto_tracker/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppButtonStyle {
  final Color color;
  final Color textColor;
  final Color borderColor;
  final Color disabledBackgroundColor;
  final Color disabledTextColor;
  final TextStyle? textStyle;

  ///Button default values
  static const double buttonDefaultHeight = 50.0;
  static const double buttonDefaultWidth = double.infinity;
  static const double badgeDefaultHeight = 20.0;
  static const double badgeDefaultWidth = 46.0;
  static const double buttonCornerRadius = 4.0;
  static const double badgeCornerRadius = 100.0;
  static const bool buttonIsEnable = true;
  static const bool buttonIsLoading = false;

  AppButtonStyle({
    required this.color,
    required this.textColor,
    required this.borderColor,
    required this.disabledBackgroundColor,
    required this.disabledTextColor,
    this.textStyle,
  });

  factory AppButtonStyle.primary(context) = AppButtonPrimary;

  factory AppButtonStyle.secondary(context) = AppButtonSecondary;

  AppButtonStyle copyWith({
    Color? color,
    Color? textColor,
    Color? borderColor,
    Color? disabledBackgroundColor,
    Color? disabledTextColor,
    TextStyle? textStyle,
  }) {
    return AppButtonStyle(
      color: color ?? this.color,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      disabledBackgroundColor: disabledBackgroundColor ?? this.disabledBackgroundColor,
      disabledTextColor: disabledTextColor ?? this.disabledTextColor,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}

class AppButtonPrimary extends AppButtonStyle {
  AppButtonPrimary(context)
      : super(
          color: appColors(context).primary,
          disabledBackgroundColor: appColors(context).grey,
          textColor: Colors.white,
          disabledTextColor: Colors.white,
          borderColor: Colors.transparent,
        );
}

class AppButtonSecondary extends AppButtonStyle {
  AppButtonSecondary(context)
      : super(
          color: Colors.transparent,
          disabledBackgroundColor: appColors(context).grey,
          textColor: appColors(context).buttonOutline,
          disabledTextColor: appColors(context).buttonOutline,
          borderColor: appColors(context).buttonOutline,
        );
}
