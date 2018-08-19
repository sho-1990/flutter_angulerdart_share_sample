import 'dart:async';

import 'package:core/src/data/crypto_data.dart';
import 'package:core/src/dependency_injection.dart';

class CryptoListLogic {
  CryptoRepository _repository;

  var _itemStreamController = StreamController<List<Crypto>>();

  get itemStream => _itemStreamController.stream;
  get itemController => _itemStreamController;

  CryptoListLogic(Injector injector) {
    _repository = injector.cryptoRepository;
  }

  Future loadCurrencies() async {
    List items;
    try {
      items = await _repository.fetchCurrencies();
    } catch (e) {
      _itemStreamController.addError(e);
      return;
    }
    print(items.length);
    _itemStreamController.add(items);
  }
}