import 'package:crypto_tracker/core/config/dio_utils/dio_header_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'crypto_client.g.dart';

@RestApi()
abstract class CryptoClient {
  factory CryptoClient(Dio dio, {String baseUrl}) = _CryptoClient;

  @GET('/list')
  Future<dynamic> cryptoList();

  @GET('/markets')
  Future<dynamic> cryptoMarket(@Query("vs_currency") String currency, @Query("ids") String ids);
}

////////////////////////////////////////////////////////////////
final cryptoClient = Provider<CryptoClient>((ref) => CryptoClient(ref.read(dioProvider)));
