import 'package:json_annotation/json_annotation.dart';

part 'crypto_details_model.g.dart';

@JsonSerializable()
class CryptoDetails {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "symbol")
  final String? symbol;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "current_price")
  final double? currentPrice;
  @JsonKey(name: "market_cap")
  final double? marketCap;
  @JsonKey(name: "market_cap_rank")
  final double? marketCapRank;
  @JsonKey(name: "fully_diluted_valuation")
  final double? fullyDilutedValuation;
  @JsonKey(name: "total_volume")
  final double? totalVolume;
  @JsonKey(name: "high_24h")
  final double? high24H;
  @JsonKey(name: "low_24h")
  final double? low24H;
  @JsonKey(name: "price_change_24h")
  final double? priceChange24H;
  @JsonKey(name: "price_change_percentage_24h")
  final double? priceChangePercentage24H;
  @JsonKey(name: "market_cap_change_24h")
  final double? marketCapChange24H;
  @JsonKey(name: "market_cap_change_percentage_24h")
  final double? marketCapChangePercentage24H;
  @JsonKey(name: "circulating_supply")
  final double? circulatingSupply;
  @JsonKey(name: "total_supply")
  final double? totalSupply;
  @JsonKey(name: "max_supply")
  final double? maxSupply;
  @JsonKey(name: "ath")
  final double? ath;
  @JsonKey(name: "ath_change_percentage")
  final double? athChangePercentage;
  @JsonKey(name: "ath_date")
  final String? athDate;
  @JsonKey(name: "atl")
  final double? atl;
  @JsonKey(name: "atl_change_percentage")
  final double? atlChangePercentage;
  @JsonKey(name: "atl_date")
  final String? atlDate;
  @JsonKey(name: "roi")
  final Roi? roi;
  @JsonKey(name: "last_updated")
  final String? lastUpdated;

  CryptoDetails({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  factory CryptoDetails.fromJson(Map<String, dynamic> json) => _$CryptoDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoDetailsToJson(this);
}

@JsonSerializable()
class Roi {
  @JsonKey(name: "times")
  final double? times;
  @JsonKey(name: "currency")
  final String? currency;
  @JsonKey(name: "percentage")
  final double? percentage;

  Roi({
    this.times,
    this.currency,
    this.percentage,
  });

  factory Roi.fromJson(Map<String, dynamic> json) => _$RoiFromJson(json);

  Map<String, dynamic> toJson() => _$RoiToJson(this);
}
