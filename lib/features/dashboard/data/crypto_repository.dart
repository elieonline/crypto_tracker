import 'cryptocurrency_model.dart';

abstract interface class CryptoRepository {
  Future<dynamic> cryptoList();
  Future<dynamic> cryptoMarket(String ids);
  void saveCryptos(List<Cryptocurrency> val);
  List<Cryptocurrency> getCryptos();
  void getAssets();
}
