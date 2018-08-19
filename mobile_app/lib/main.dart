import 'package:flutter/material.dart';
import 'package:mobile_app/ui/app.dart';
import 'dependency_injection.dart';

void main() {
  MInjector.configure(Flavor.PROD);
  runApp(App());
}
