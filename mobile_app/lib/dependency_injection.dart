
import 'package:core/core.dart';
import 'package:mobile_app/data/crypto_data_prod.dart';

enum Flavor {
  MOCK, PROD
}

class MInjector extends Injector {
  static final MInjector _singleton = MInjector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory MInjector() {
    return _singleton;
  }

  MInjector._internal();

  CryptoRepository get cryptoRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return MockCryptoRepository();
      default:
        return ProdCryptoRepository();
    }
  }
}