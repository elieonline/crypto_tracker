// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_tracker/core/enums/enums.dart';

import '../data/crypto_details_model.dart';

class CryptoState {
  final List<CryptoDetails> details;
  final LoadState loadState;
  final LoadState assetLoadState;
  final LoadState detailsLoadState;
  final String? errorMessage;

  CryptoState({
    required this.details,
    required this.loadState,
    required this.assetLoadState,
    required this.detailsLoadState,
    this.errorMessage,
  });

  factory CryptoState.initial() {
    return CryptoState(
      details: [],
      loadState: LoadState.idle,
      assetLoadState: LoadState.idle,
      detailsLoadState: LoadState.idle,
    );
  }

  CryptoState copyWith({
    List<CryptoDetails>? details,
    LoadState? loadState,
    LoadState? assetLoadState,
    LoadState? detailsLoadState,
    String? errorMessage,
  }) {
    return CryptoState(
      details: details ?? this.details,
      loadState: loadState ?? this.loadState,
      assetLoadState: assetLoadState ?? this.assetLoadState,
      detailsLoadState: detailsLoadState ?? this.detailsLoadState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
