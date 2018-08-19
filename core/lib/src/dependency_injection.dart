
import 'package:core/src/data/crypto_data.dart';

enum Flavor {
  MOCK, PROD
}

abstract class Injector {
  CryptoRepository get cryptoRepository;
}