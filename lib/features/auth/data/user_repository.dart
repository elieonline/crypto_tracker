import 'package:flutter/material.dart';

abstract interface class UserRepository {
  void saveCurrentThemeMode(ThemeMode val);
  ThemeMode getCurrentThemeMode();
}
