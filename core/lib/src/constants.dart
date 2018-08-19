get AppName => "Introduction";

class AppInfo {
  static const name = "Introduction";
}

class Urls {
  static const cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
}


abstract class AppColors<T> {
  T primarySwatch();
}
