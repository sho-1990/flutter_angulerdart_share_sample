import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  CryptoListLogic _logic = CryptoListLogic();

  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        trailing: Icon(CupertinoIcons.home),
        middle: Text(AppInfo.name),
        ),
      body: _cryptoWidget());
  }

  Widget _cryptoWidget() {
    return StreamBuilder(
      stream: _logic.itemStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          _showSnackBar(context);
          return Center(child: Text("error"),);
        }
        if (!snapshot.hasData) {
          _logic.loadCurrencies();
          if (defaultTargetPlatform == TargetPlatform.iOS) {
            return Center(child: CupertinoActivityIndicator(),);
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        }
        List<Crypto> cryptoItems = snapshot.data;
        return Container(
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  itemCount: cryptoItems.length,
                  itemBuilder: (context, int index) {
                    final int i = index ~/ 2;
                    final Crypto currency = cryptoItems[index];
                    final MaterialColor color = _colors[i % _colors.length];
                    return _getListItemUi(currency, color);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }


  Widget _getListItemUi(Crypto currency, MaterialColor color) {
    return Column(
      children: <Widget>[
        Divider(),
        ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Image.network(
                  "https://rawgit.com/atomiclabs/cryptocurrency-icons/master/32@2x/color/${currency.symbol.toLowerCase()}@2x.png"),
            ),
            title: Text(currency.name, style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: _getSubtitleText(currency.priceUsd, currency.percentChange1h)
        ),
      ],
    );
  }


  _getSubtitleText(String priceUsd, String percentChange1h) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$priceUsd\n", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour: $percentChange1h%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentChange1h) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(
            children: [priceTextWidget, percentageChangeTextWidget]));
  }

  Future _showSnackBar(BuildContext context) async {
    var snackBar = SnackBar(
      duration: Duration(minutes: 1),
      content: Text("Please reload"),
      action: SnackBarAction(label: 'reload', onPressed: () {
        debugPrint("reload!");
        _logic.itemController.add(null);
      }),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
