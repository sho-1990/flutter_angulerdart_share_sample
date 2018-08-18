import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:mobile_app/trans.dart';
import 'package:mobile_app/ui/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appColors = OnFlutter();
    return MaterialApp(
      title: AppInfo.name,
      theme: ThemeData(
        primarySwatch: appColors.primarySwatch()
      ),
      home: Home(),
    );
  }
}
