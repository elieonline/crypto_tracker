// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:crypto_tracker/core/services/local_database/asset_storage_impl.dart';
import 'package:crypto_tracker/core/services/local_database/hive_keys.dart';
import 'package:crypto_tracker/core/services/local_database/local_storage_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:crypto_tracker/core/config/exceptions/app_exceptions.dart';
import 'package:crypto_tracker/core/services/client/crypto_client.dart';
import 'package:crypto_tracker/core/services/local_database/local_storage.dart';

import 'asset_model.dart';
import 'crypto_repository.dart';
import 'cryptocurrency_model.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoClient _cryptoClient;
  final LocalStorage _storage;
  final Ref _ref;

  CryptoRepositoryImpl(
    this._cryptoClient,
    this._storage,
    this._ref,
  );

  @override
  Future cryptoList() async {
    try {
      return await _cryptoClient.cryptoList();
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  @override
  Future cryptoMarket(String ids) async {
    try {
      return await _cryptoClient.cryptoMarket('usd', ids);
    } on DioException catch (e) {
      return AppException.handleError(e);
    }
  }

  @override
  List<Cryptocurrency> getCryptos() {
    final resp = _storage.get(HiveKeys.cryptos, defaultValue: jsonEncode([]));
    final decoded = jsonDecode(resp);
    return decoded is List<dynamic>
        ? decoded.map<Cryptocurrency>((i) => Cryptocurrency.fromJson(i as Map<String, dynamic>)).toList()
        : List.empty();
  }

  @override
  void saveCryptos(List<Cryptocurrency> val) async {
    _ref.read(cryptoProvider.notifier).state = val;
    await _storage.put(HiveKeys.cryptos, jsonEncode(val));
  }

  @override
  void getAssets() {
    final temp = _ref.read(assetStore).getAll();
    _ref.read(assetProvider.notifier).state = temp.toList();
  }
}

final cryptoProvider = StateProvider<List<Cryptocurrency>>((ref) {
  return ref.read(cryptoRepository).getCryptos();
});

final assetProvider = StateProvider<List<Asset>>((ref) {
  return ref.read(assetStore).getAll();
});

final cryptoRepository = Provider<CryptoRepository>(
  (ref) => CryptoRepositoryImpl(ref.read(cryptoClient), ref.read(localDB), ref),
);
