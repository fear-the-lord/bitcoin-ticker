import 'package:http/http.dart' as http;
import 'dart:convert';

// Adding all the currencies in the list
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

// Adding all the crypto-currencies in the list
const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String URL = 'https://rest.coinapi.io/v1/exchangerate';
const String APIKEY = '7B3C3AB1-7EA1-4226-9EC3-20441AFD57AE';

class CoinData {
  CoinData(this.currency, this.crypto);
  String currency, crypto;

  Future getCoinData() async {
    String requestURL = '$URL/$crypto/$currency?apikey=$APIKEY';
    // Make a GET request to the URL and wait for the response
    http.Response response = await http.get(requestURL);
    // Check if the request was successful
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var price = decodedData['rate'];
      return price;
    } else {
      print(response.statusCode);
      print('Problem with GET request');
    }
  }
}
