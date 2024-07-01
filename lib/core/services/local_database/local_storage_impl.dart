import 'package:flutter_riverpod/flutter_riverpod.dart';

import './hive_keys.dart';
import './local_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage implements LocalStorage {
  HiveStorage(this.box);
  final Box box;
  @override
  Future<void> put(dynamic key, dynamic value) async {
    await box.put(key, value);
  }

  @override
  T? get<T>(String key, {dynamic defaultValue}) {
    return box.get(key, defaultValue: defaultValue);
  }

  @override
  dynamic getAt(int key) {
    return box.getAt(key);
  }

  @override
  Future<int> add(value) async {
    return await box.add(value);
  }

  @override
  Future<int> clear() async {
    return await box.clear();
  }

  @override
  Future<void> delete(value) async {
    return await box.delete(value);
  }

  @override
  Future<void> putAll(Map<String, dynamic> entries) async {
    return await box.putAll(entries);
  }
}

final localDB = Provider<LocalStorage>((ref) => HiveStorage(Hive.box(HiveKeys.appBox)));
