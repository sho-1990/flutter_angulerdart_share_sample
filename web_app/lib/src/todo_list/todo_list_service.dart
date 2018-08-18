import 'dart:async';

import 'package:angular/core.dart';
import 'package:core/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  List<String> mockTodoList = thingsTodo().toList();

  Future<List<String>> getTodoList() async => mockTodoList;
}

