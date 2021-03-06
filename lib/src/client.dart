import 'dart:convert';

import 'package:http/http.dart' as http;

import '../bitkub_client.dart';
import 'models/depth.dart';
import 'models/orders.dart';
import 'models/status.dart';
import 'models/symbols.dart';
import 'models/ticker.dart';

///Create a instant of BitkubClient to access Bitkub's API
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
  ///
  ///Return BKStatus object.
  Future<BkStatus> getStatus() async {
    const ENDPOINT = '/status';

    final finalUri = BASE_URL + ENDPOINT;

    final response = await _httpWrapper(finalUri);

    if (response != null) return BkStatus.fromJson(response);
    return null;
    //return BkStatus.fromJson(await _dioUriGet(finalUri));
  }

  ///Get server timestamp.
  ///
  ///Return DateTime object.
  Future<DateTime> getServerTimestamp() async {
    const ENDPOINT = '/servertime';

    final finalUri = BASE_URL + ENDPOINT;
    final response = await _httpWrapper(finalUri);

    if (response != null) {
      return DateTime.fromMillisecondsSinceEpoch(jsonDecode(response) * 1000);
    }
    return null;
  }

  ///Get all available symbols.
  ///
  ///Ex.
  ///   var symbols = bitkubClient.getAllSymbols();
  Future<BkSymbolList> getAllSymbols() async {
    const ENDPOINT = '/market/symbols';

    final finalUri = BASE_URL + ENDPOINT;
    final response = await _httpWrapper(finalUri);

    if (response != null) {
      return BkSymbolList.fromJson(response);
    }
    return null;
  }

  ///Get list of trades history for a specific [symbol] and query limit of [limit]
  ///Default [limit] is 30
  ///
  ///Ex.
  ///   var openOrders = bitkubClient.getTrades(BkSymbols.THB_BTC);
  Future<BkTradeList> getTrades(BkSymbols symbol, {int limit = 30}) async {
    const ENDPOINT = '/market/trades';
    final queryStringSymbol = '?sym=${symbol.symbolString}';
    final queryStringLimit = '&lmt=$limit';

    final finalUrl = BASE_URL + ENDPOINT + queryStringSymbol + queryStringLimit;

    final response = await _httpWrapper(finalUrl);
    if (response != null) return BkTradeList.fromJson(response);
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
  ///
  ///Ex.
  ///   var openOrders = bitkubClient.getSellOrders(BkSymbols.THB_BTC);
  Future<List<BkOrder>> getSellOrders(BkSymbols symbol,
      {int limit = 30}) async {
    const ENDPOINT = '/market/asks';
    final queryStringSymbol = '?sym=${symbol.symbolString}';
    final queryStringLimit = '&lmt=$limit';

    final finalUrl = BASE_URL + ENDPOINT + queryStringSymbol + queryStringLimit;

    final response = await _httpWrapper(finalUrl);
    if (response != null) {
      return (json.decode(response)['result'] as List<dynamic>)
          .map((e) => BkOrder.fromList(e))
          .toList();
    }
    return [];
  }

  ///Get list of open orders containing only bids for a specific [symbol] and query limit of [limit]
  ///Default [limit] is 30
  ///
  ///Ex.
  ///   var openOrders = bitkubClient.getSellOrders(BkSymbols.THB_BTC);
  Future<List<BkOrder>> getBuyOrders(BkSymbols symbol, {int limit = 30}) async {
    const ENDPOINT = '/market/bids';
    final queryStringSymbol = '?sym=${symbol.symbolString}';
    final queryStringLimit = '&lmt=$limit';

    final finalUrl = BASE_URL + ENDPOINT + queryStringSymbol + queryStringLimit;

    final response = await _httpWrapper(finalUrl);
    if (response != null) {
      return (json.decode(response)['result'] as List<dynamic>)
          .map((e) => BkOrder.fromList(e))
          .toList();
    }
    return [];
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

  ///Get depth information for a specific [symbol] with size [size].
  ///Usually used in depth chart or quick skim through the orders
  ///Default [size] is 30
  ///
  ///Ex.
  ///   var depth = bitkubClient.getDepthInformation(BkSymbols.THB_BTC);
  Future<BkDepth> getDepthInformation(BkSymbols symbol, {int size = 30}) async {
    const ENDPOINT = '/market/depth';
    final queryStringSymbol = '?sym=${symbol.symbolString}';
    final queryStringSize = '&lmt=$size';

    final finalUrl = BASE_URL + ENDPOINT + queryStringSymbol + queryStringSize;

    final response = await _httpWrapper(finalUrl);
    if (response != null) return BkDepth.fromJson(response);
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
