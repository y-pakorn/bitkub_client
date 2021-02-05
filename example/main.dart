import 'package:bitkub_client/bitkub_client.dart';

void main() {
  var client = BitkubClient();
  var openOrders = client.getOpenOrders(BkSymbols.THB_BTC);
  //...
  print(openOrders);

  var socketClient = BitkubSocketClient();
  var tickerStream = socketClient.connectToTickerStream([BkSymbols.THB_BTC]);
  tickerStream.listen((ticker) {
    //...
    print(ticker);
  });
}
