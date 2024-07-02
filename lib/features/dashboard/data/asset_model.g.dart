// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssetAdapter extends TypeAdapter<Asset> {
  @override
  final int typeId = 1;

  @override
  Asset read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Asset()
      ..id = fields[1] == null ? '' : fields[1] as String?
      ..assetId = fields[2] == null ? '' : fields[2] as String?
      ..assetName = fields[3] == null ? '' : fields[3] as String?
      ..assetLogo = fields[4] == null ? '' : fields[4] as String?
      ..unit = fields[5] == null ? 0 : fields[5] as double?
      ..buyPrice = fields[6] == null ? 0 : fields[6] as double?
      ..buyValue = fields[7] == null ? 0 : fields[7] as double?
      ..currentValue = fields[8] == null ? 0 : fields[8] as double?;
  }

  @override
  void write(BinaryWriter writer, Asset obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.assetId)
      ..writeByte(3)
      ..write(obj.assetName)
      ..writeByte(4)
      ..write(obj.assetLogo)
      ..writeByte(5)
      ..write(obj.unit)
      ..writeByte(6)
      ..write(obj.buyPrice)
      ..writeByte(7)
      ..write(obj.buyValue)
      ..writeByte(8)
      ..write(obj.currentValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
