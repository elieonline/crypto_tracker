import 'package:crypto_tracker/core/services/local_database/hive_keys.dart';
import 'package:crypto_tracker/core/services/local_database/local_storage.dart';
import 'package:crypto_tracker/core/services/local_database/local_storage_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final LocalStorage _storage;
  final Ref _ref;

  UserRepositoryImpl(this._storage, this._ref);

  @override
  ThemeMode getCurrentThemeMode() {
    switch (_storage.get(HiveKeys.themeMode) ?? ThemeMode.system.name) {
      case "dark":
        return ThemeMode.dark;
      case "light":
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Future<void> saveCurrentThemeMode(ThemeMode val) async {
    _ref.read(themeModeProvider.notifier).state = val;
    await _storage.put(HiveKeys.themeMode, val.name);
  }
}

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ref.read(userRepository).getCurrentThemeMode();
});

final userRepository = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(ref.read(localDB), ref),
);
