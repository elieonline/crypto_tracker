import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable()
class RefreshToken {
  @JsonKey(defaultValue: false)
  final bool status;
  @JsonKey(defaultValue: "")
  final String message;
  final Data? data;

  RefreshToken({
    required this.status,
    required this.message,
    this.data,
  });

  factory RefreshToken.fromJson(Map<String, dynamic> json) => _$RefreshTokenFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(defaultValue: "")
  final String accessToken;
  @JsonKey(defaultValue: "")
  final String refreshToken;
  @JsonKey(defaultValue: "")
  final String refreshTokenExpiresIn;

  Data({
    required this.accessToken,
    required this.refreshToken,
    required this.refreshTokenExpiresIn,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
