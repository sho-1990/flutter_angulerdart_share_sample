import 'dart:async';

import 'package:angular/core.dart';
import 'package:core/core.dart';
import 'package:web_app/src/dependency_injection.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  final CryptoListLogic _logic = CryptoListLogic(WInjector());

  get controller => _logic.itemController;
  Stream<List<Crypto>> get stream => _logic.itemStream;
  List<String> mockTodoList = thingsTodo().toList();


  Future loadCurrencies() async {
    _logic.loadCurrencies();
  }

  Future<List<String>> getTodoList() async => mockTodoList;
}

