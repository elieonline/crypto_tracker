// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptocurrency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cryptocurrency _$CryptocurrencyFromJson(Map<String, dynamic> json) =>
    Cryptocurrency(
      id: json['id'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CryptocurrencyToJson(Cryptocurrency instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
    };
