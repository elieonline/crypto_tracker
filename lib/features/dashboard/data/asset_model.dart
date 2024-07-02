import 'package:hive_flutter/hive_flutter.dart';

part 'asset_model.g.dart';

@HiveType(typeId: 1)
class Asset {
  @HiveField(1, defaultValue: "")
  String? id;
  @HiveField(2, defaultValue: "")
  String? assetId;
  @HiveField(3, defaultValue: "")
  String? assetName;
  @HiveField(4, defaultValue: "")
  String? assetLogo;
  @HiveField(5, defaultValue: 0)
  double? unit;
  @HiveField(6, defaultValue: 0)
  double? buyPrice;
  @HiveField(7, defaultValue: 0)
  double? buyValue;
  @HiveField(8, defaultValue: 0)
  double? currentValue;
}
