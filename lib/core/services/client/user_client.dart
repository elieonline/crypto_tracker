import 'dart:io';
import 'package:crypto_tracker/core/config/dio_utils/dio_header_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'user_client.g.dart';

@RestApi()
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;
}

////////////////////////////////////////////////////////////////
final userClient = Provider<UserClient>((ref) => UserClient(ref.read(dioProvider)));
