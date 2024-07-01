import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final T? data;
  final Status status;

  const BaseResponse({
    this.data,
    required this.status,
  }) : super();

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseResponseFromJson(json, fromJsonT);
  }

  factory BaseResponse.fromMap(Map<String, dynamic> json) {
    return BaseResponse(
      data: null,
      status: json['status'] ?? Status(),
    );
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$BaseResponseToJson(this, toJsonT);
}

@JsonSerializable()
class Status {
  @JsonKey(name: "timestamp")
  final String? timestamp;
  @JsonKey(name: "error_code")
  final int? errorCode;
  @JsonKey(name: "error_message")
  final dynamic errorMessage;
  @JsonKey(name: "elapsed")
  final int? elapsed;
  @JsonKey(name: "credit_count")
  final int? creditCount;
  @JsonKey(name: "notice")
  final dynamic notice;

  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
