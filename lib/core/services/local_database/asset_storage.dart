import 'package:crypto_tracker/features/dashboard/data/asset_model.dart';

abstract class AssetStorage {
  Future<int> add(Asset asset);
  List<Asset> getAll();
  Future<int> clear();
}
