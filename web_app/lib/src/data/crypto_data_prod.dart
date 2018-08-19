import 'dart:async';
import 'dart:convert';
import 'package:core/core.dart';
import 'package:core/src/data/crypto_data.dart';
import 'package:http/http.dart' as http;
import 'package:http/browser_client.dart';

class ProdCryptoRepository implements CryptoRepository {

  @override
  Future<List<Crypto>> fetchCurrencies() async {
    http.Response response = await fetch();
    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw FetchDataException(
        message: "An error ocurred : [Status Code : $statusCode]"
      );
    }
    return responseBody.map((c) => Crypto.fromMap(c)).toList();
  }

  Future<http.Response> fetch() async {
    var client = BrowserClient();
    return client.get(Urls.cryptoUrl);
  }

}