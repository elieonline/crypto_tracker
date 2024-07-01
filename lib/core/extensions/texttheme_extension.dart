import 'package:flutter/material.dart';

extension ThemeText on TextTheme {
  //TEXT 0
  TextStyle get text => const TextStyle(fontSize: 12, fontWeight: FontWeight.w300);
  TextStyle get textRegular => const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  TextStyle get textMedium => const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  TextStyle get textSemiBold => const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  TextStyle get textBold => const TextStyle(fontSize: 12, fontWeight: FontWeight.w700);

  //TEXT 1
  TextStyle get text1 => const TextStyle(fontSize: 14, fontWeight: FontWeight.w300);
  TextStyle get text1Regular => const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  TextStyle get text1Medium => const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  TextStyle get text1SemiBold => const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  TextStyle get text1Bold => const TextStyle(fontSize: 14, fontWeight: FontWeight.w700);

  //TEXT 2
  TextStyle get text2 => const TextStyle(fontSize: 16, fontWeight: FontWeight.w300);
  TextStyle get text2Regular => const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  TextStyle get text2Medium => const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle get text2SemiBold => const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle get text2Bold => const TextStyle(fontSize: 16, fontWeight: FontWeight.w700);

  //Header 1
  TextStyle get header1 => const TextStyle(fontSize: 24, fontWeight: FontWeight.w300);
  TextStyle get header1Regular => const TextStyle(fontSize: 24, fontWeight: FontWeight.w400);
  TextStyle get header1Medium => const TextStyle(fontSize: 24, fontWeight: FontWeight.w500);
  TextStyle get header1SemiBold => const TextStyle(fontSize: 24, fontWeight: FontWeight.w600);
  TextStyle get header1Bold => const TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
  TextStyle get header1ExtraBold => const TextStyle(fontSize: 24, fontWeight: FontWeight.w800);

  //Header 2
  TextStyle get header2 => const TextStyle(fontSize: 36, fontWeight: FontWeight.w300);
  TextStyle get header2Regular => const TextStyle(fontSize: 36, fontWeight: FontWeight.w400);
  TextStyle get header2Medium => const TextStyle(fontSize: 36, fontWeight: FontWeight.w500);
  TextStyle get header2SemiBold => const TextStyle(fontSize: 36, fontWeight: FontWeight.w600);
  TextStyle get header2Bold => const TextStyle(fontSize: 36, fontWeight: FontWeight.w700);
  TextStyle get header2ExtraBold => const TextStyle(fontSize: 36, fontWeight: FontWeight.w800);
}
