import 'dart:async';
import 'dart:convert';
import 'package:core/core.dart';
import 'package:http/http.dart' as http;

class ProdCryptoRepository implements CryptoRepository {

  @override
  Future<List<Crypto>> fetchCurrencies() async {
    http.Response response = await http.get(Urls.cryptoUrl);
    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw FetchDataException(
        message: "An error ocurred : [Status Code : $statusCode]"
      );
    }
    return responseBody.map((c) => Crypto.fromMap(c)).toList();
  }

}