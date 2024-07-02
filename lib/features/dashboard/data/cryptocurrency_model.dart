import 'package:json_annotation/json_annotation.dart';

part 'cryptocurrency_model.g.dart';

@JsonSerializable()
class Cryptocurrency {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "symbol")
  final String? symbol;
  @JsonKey(name: "name")
  final String? name;

  Cryptocurrency({
    this.id,
    this.symbol,
    this.name,
  });

  factory Cryptocurrency.fromJson(Map<String, dynamic> json) => _$CryptocurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CryptocurrencyToJson(this);
}
