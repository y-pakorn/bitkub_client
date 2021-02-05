import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/orders.dart';
import 'models/status.dart';
import 'models/symbols.dart';
import 'models/ticker.dart';

///Create a instant of BitkubServices to access api
///
///Only support public, non-secure (no authentication) API for now
///
///Ex.
///     var bitkubClient = BitkubClient();
class BitkubClient {
  ///Base url of the API
  static const BASE_URL = 'https://api.bitkub.com/api';

  ///Get endpoint status.
  ///When status is not ok, it is highly recommended to wait until the status changes back to ok.
  /// ### This class is deprecated, Not working but existed in Bitkub API Documentation
  ///
  ///Return BKStatus object.
  @Deprecated('Not working but existed in doc.')
  Future<BkStatus> getStatus() async {
    const ENDPOINT = '/status';

    final finalUri = BASE_URL + ENDPOINT;

    final response = await _httpWrapper(finalUri);

    if (response != null) return BkStatus.fromJson(response);
    return null;
    //return BkStatus.fromJson(await _dioUriGet(finalUri));
  }

  ///Get server timestamp.
  /// ### This class is deprecated, Not working but existed in Bitkub API Documentation
  ///
  ///Return DateTime object.
  @Deprecated('Not working but existed in doc.')
  Future<DateTime> getServerTimestamp() async {
    const ENDPOINT = '/servertime';

    final finalUri = BASE_URL + ENDPOINT;
    final response = await _httpWrapper(finalUri);

    if (response != null) {
      return DateTime.fromMillisecondsSinceEpoch(response * 1000);
    }
    return null;
  }

  ///Get ticker information
  ///If provided [symbol] will return List of BkTicker ONLY with that [symbol] element.
  ///
  ///Ex.
  ///   var tickers = bitkubClient.getTickers(BkSymbols.THB_BTC);
  Future<BkTickerList> getTickers({BkSymbols symbol}) async {
    const ENDPOINT = '/market/ticker';
    final queryString = symbol == null ? '' : '?sym=$symbol';

    final finalUri = BASE_URL + ENDPOINT + queryString;

    final response = await _httpWrapper(finalUri);

    if (response != null) return BkTickerList.fromJson(response);
    return null;
  }

  ///Get list of open orders containing only asks for a specific [symbol] and query limit of [limit]
  ///Default [limit] is 30
  /// ### This class is deprecated, Not working but existed in Bitkub API Documentation
  ///
  ///Ex.
  ///   var openOrders = bitkubClient.getSellOrders(BkSymbols.THB_BTC);
  @Deprecated('Not working but existed in doc')
  Future<List<BkOrder>> getSellOrders(BkSymbols symbol,
      {int limit = 30}) async {
    const ENDPOINT = '/market/asks';
    final queryStringSymbol = '?sym=${symbol.symbolString}';
    final queryStringLimit = '&lmt=$limit';

    final finalUrl = BASE_URL + ENDPOINT + queryStringSymbol + queryStringLimit;

    final response = await _httpWrapper(finalUrl);
    if (response != null) {
      return json
          .decode(response)['result']
          .map((e) => BkOrder.fromList(e))
          .toList();
    }
    return null;
  }

  ///Get list of open orders containing only bids for a specific [symbol] and query limit of [limit]
  ///Default [limit] is 30
  /// ### This class is deprecated, Not working but existed in Bitkub API Documentation
  ///
  ///Ex.
  ///   var openOrders = bitkubClient.getSellOrders(BkSymbols.THB_BTC);
  @Deprecated('Not working but existed in doc')
  Future<List<BkOrder>> getBuyOrders(BkSymbols symbol, {int limit = 30}) async {
    const ENDPOINT = '/market/bids';
    final queryStringSymbol = '?sym=${symbol.symbolString}';
    final queryStringLimit = '&lmt=$limit';

    final finalUrl = BASE_URL + ENDPOINT + queryStringSymbol + queryStringLimit;

    final response = await _httpWrapper(finalUrl);
    if (response != null) {
      return json
          .decode(response)['result']
          .map((e) => BkOrder.fromList(e))
          .toList();
    }
    return null;
  }

  ///Get list of open orders containing bids and asks for a specific [symbol] and query limit of [limit]
  ///Default [limit] is 30
  ///
  ///Ex.
  ///   var openOrders = bitkubClient.getOpenOrders(BkSymbols.THB_BTC);
  Future<BkOpenOrders> getOpenOrders(BkSymbols symbol, {int limit = 30}) async {
    const ENDPOINT = '/market/books';
    final queryStringSymbol = '?sym=${symbol.symbolString}';
    final queryStringLimit = '&lmt=$limit';

    final finalUrl = BASE_URL + ENDPOINT + queryStringSymbol + queryStringLimit;

    final response = await _httpWrapper(finalUrl);
    if (response != null) return BkOpenOrders.fromJson(response);
    return null;
  }
}

Future<dynamic> _httpWrapper(String url) async {
  final httpClient = http.Client();

  try {
    final response = await httpClient.get(url);
    return utf8.decode(response.bodyBytes);
  } catch (error) {
    rethrow;
  } finally {
    httpClient.close();
  }
}
