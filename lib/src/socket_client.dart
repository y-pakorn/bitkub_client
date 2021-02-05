import 'package:web_socket_channel/web_socket_channel.dart';

import './models/symbols.dart';
import './models/matched_order.dart';
import 'models/ticker.dart';

///Create an instance of BitkubSocketClient to access Bitkub's websocket API
///
///Only support public, non-secure (no authentication) API for now
///
///Ex.
///     var socketClient = BitkubSocketClient();
class BitkubSocketClient {
  ///Base url of the websocket API
  static const BASE_URL = 'wss://api.bitkub.com/websocket-api/';

  ///Connect to stream of BkMatchedOrder for single or multiple [symbols]
  ///
  ///The trade stream provides real-time data on matched orders.
  ///Each trade contains buy order id and sell order id. Order id is unique by the order side (buy/sell) and symbol.
  ///
  ///Ex.
  ///   var stream = socketClient.connectToTradeStream([BkSymbols.THB_BTC]);
  Stream<BkMatchedOrder> connectToTradeStream(List<BkSymbols> symbols) {
    final ENDPOINT =
        symbols.map((e) => 'market.trade.${e.symbolString}').join(',');

    final finalUrl = BASE_URL + ENDPOINT;
    print(finalUrl);

    final channel = WebSocketChannel.connect(Uri.parse(finalUrl));
    return channel.stream.map((e) => BkMatchedOrder.fromJson(e));
  }

  ///Connect to stream of BkTicker for single or multiple [symbols]
  ///
  ///The ticker stream provides real-time data on ticker of the specified symbol.
  ///Ticker for each symbol is re-calculated on trade order creation, cancellation, and fulfillment.
  ///
  ///Ex.
  ///   var stream = socketClient.connectToTickerStream([BkSymbols.THB_BTC]);
  Stream<BkTicker> connectToTickerStream(List<BkSymbols> symbols) {
    final ENDPOINT =
        symbols.map((e) => 'market.ticker.${e.symbolString}').join(',');

    final finalUrl = BASE_URL + ENDPOINT;
    print(finalUrl);

    final channel = WebSocketChannel.connect(Uri.parse(finalUrl));
    return channel.stream.map((e) => BkTicker.fromStreamJson(e));
  }
}
