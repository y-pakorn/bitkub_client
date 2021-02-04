# Bitkub Client for Dart

A well-documented client library for accessing Bitkub public APIs, works for Dart and Flutter.


## Todos (In orders)

- [x] Non-secure endpoints
- [ ] WebSocket APIs as streams
- [ ] Full examples
- [ ] Migrate to Null-safety
- [ ] Secure endpoints using authentication

## Usage

Getting tickers

```dart
import 'package:bitkub_client/bitkub_client.dart';

void main() async {
  //Initialize the client
  var client = BitkubClient();
  //Get the tickers
  var tickers = await client.getTickers(symbol: BkSymbols.THB_BTC);
  print(tickers.tickerList.first.lastPrice);
}
```

Getting ask,bid orders for specific currency

```dart
void main() async {
  //Initialize the client
  var client = BitkubClient();
  //Get the orders
  var orders = await client.getOpenOrders(BkSymbols.THB_BTC);
  print(orders.asks.first.quoteRate);
```

## Contribution

Feel free to contribute and shot the pull requests!

## License

MIT
