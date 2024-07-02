import 'package:crypto_tracker/features/dashboard/data/asset_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'asset_storage.dart';
import 'hive_keys.dart';

class AssetStorageImpl extends AssetStorage {
  AssetStorageImpl(this.box);
  final Box<Asset> box;

  @override
  Future<int> add(Asset asset) async {
    return await box.add(asset);
  }

  @override
  List<Asset> getAll() {
    return box.values.toList();
  }

  @override
  Future<int> clear() async {
    return await box.clear();
  }
}

final assetStore = Provider<AssetStorage>(
  (ref) => AssetStorageImpl(Hive.box<Asset>(HiveKeys.assetBox)),
);
