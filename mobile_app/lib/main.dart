import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/ui/app.dart';

void main() {
  Injector.configure(Flavor.PROD);
  runApp(App());
}
