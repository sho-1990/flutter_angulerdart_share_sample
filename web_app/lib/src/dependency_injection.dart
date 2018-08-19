
import 'package:core/core.dart';
import 'package:core/src/data/crypto_data.dart';
import 'package:core/src/data/crypto_data_mock.dart';
import 'data/crypto_data_prod.dart';

enum Flavor {
  MOCK, PROD
}

class WInjector extends Injector {
  static final WInjector _singleton = WInjector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory WInjector() {
    return _singleton;
  }

  WInjector._internal();

  CryptoRepository get cryptoRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return MockCryptoRepository();
      default:
        return ProdCryptoRepository();
    }
  }
}