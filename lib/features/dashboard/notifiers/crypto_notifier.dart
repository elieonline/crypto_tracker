import 'package:crypto_tracker/core/enums/enums.dart';
import 'package:crypto_tracker/core/services/local_database/asset_storage.dart';
import 'package:crypto_tracker/core/services/local_database/asset_storage_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/asset_model.dart';
import '../data/crypto_details_model.dart';
import '../data/crypto_repository.dart';
import '../data/crypto_repository_impl.dart';
import '../data/cryptocurrency_model.dart';
import 'crypto_state.dart';

class CryptoNotifier extends StateNotifier<CryptoState> {
  final CryptoRepository _cryptoRepository;
  final AssetStorage _assetStorage;
  CryptoNotifier(this._cryptoRepository, this._assetStorage) : super(CryptoState.initial());

  void fetchCryptoList() async {
    final cache = _cryptoRepository.getCryptos();
    if (cache.isEmpty) {
      state = state.copyWith(loadState: LoadState.loading);
    }
    try {
      final response = await _cryptoRepository.cryptoList();
      if (response.runtimeType is String) throw response;
      _cryptoRepository.saveCryptos(
        response is List<dynamic>
            ? response.map<Cryptocurrency>((i) => Cryptocurrency.fromJson(i as Map<String, dynamic>)).toList()
            : List.empty(),
      );
      state = state.copyWith(loadState: LoadState.success);
    } catch (e) {
      state = state.copyWith(
        loadState: LoadState.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future fetchCryptoDetails(String ids) async {
    state = state.copyWith(detailsLoadState: LoadState.loading, details: []);
    try {
      final response = await _cryptoRepository.cryptoMarket(ids);
      if (response.runtimeType is String) throw response;
      final model = response is List<dynamic>
          ? response.map<CryptoDetails>((i) => CryptoDetails.fromJson(i as Map<String, dynamic>)).toList()
          : List.empty();
      state = state.copyWith(
        detailsLoadState: LoadState.success,
        details: model as List<CryptoDetails>,
      );
    } catch (e) {
      state = state.copyWith(
        detailsLoadState: LoadState.error,
        errorMessage: e.toString(),
      );
    }
  }

  void addAsset(Cryptocurrency crypto, {double unit = 0, double buyPrice = 0}) async {
    state = state.copyWith(assetLoadState: LoadState.loading);
    try {
      await fetchCryptoDetails(crypto.id ?? "");
      if (state.detailsLoadState != LoadState.success) return;
      final asset = Asset()
        ..id = ""
        ..assetId = crypto.id
        ..assetName = crypto.name
        ..assetLogo = state.details[0].image
        ..unit = unit
        ..buyPrice = buyPrice
        ..buyValue = unit * buyPrice;
      final response = await _assetStorage.add(asset);
      if (response < 1) throw response;
      state = state.copyWith(assetLoadState: LoadState.success);
    } catch (e) {
      state = state.copyWith(assetLoadState: LoadState.error);
    }
  }

  void fetchAssets() async {
    try {
      _cryptoRepository.getAssets();
    } catch (_) {}
  }

  void reset() {
    state = state.copyWith(
      errorMessage: "",
      detailsLoadState: LoadState.idle,
      assetLoadState: LoadState.idle,
    );
  }
}

final cryptoNotifier = StateNotifierProvider<CryptoNotifier, CryptoState>((_) {
  return CryptoNotifier(_.read(cryptoRepository), _.read(assetStore));
});
