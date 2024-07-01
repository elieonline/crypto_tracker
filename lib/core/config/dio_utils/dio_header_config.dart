import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_strings.dart';
import 'header_interceptors.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = AuthStrings.baseUrl;
  dio.options.headers = {'Content-Type': 'application/json', "accept": 'application/json'};
  dio.interceptors.add(
    HeaderInterceptor(
      dio: dio,
      ref: ref,
    ),
  );

  return dio;
});