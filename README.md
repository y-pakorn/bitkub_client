<h1 align="center">Bitkub Client for Dart</h1>
<p align="center">
  <p align="center"><img alt="Header" src="https://i.imgur.com/KxghDeQ.png"></p>
  <p align="center">A well-documented client library for accessing Bitkub public APIs, works for Dart and Flutter.</p>
  <p align="center">
    <a href="/LICENSE.md"><img alt="Software License" src="https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square"></a>
    <a href="https://github.com/y-pakorn/bitkub_client/issues"><img alt="Actions" src="https://img.shields.io/github/issues/y-pakorn/bitkub_client"></a>
    <a href="https://github.com/y-pakorn/cutimetable-api/pulls"><img alt="Doc" src="https://img.shields.io/pub/v/bitkub_client"></a>
  </p>
</p>


## Todos (In orders)

- [x] Non-secure endpoints
- [x] WebSocket APIs as streams
- [x] Full examples
- [ ] Migrate to Null-safety
- [ ] Secure endpoints using authentication

## Documentation

Documentation of Bitkub Client for Dart can be found [here](https://pub.dev/documentation/bitkub_client/latest/)

Official Documentation of Bikub public API can be found [here](https://github.com/bitkub/bitkub-official-api-docs)

## Usage

Getting tickers

```dart
 //Initialize the client
 var client = BitkubClient();
 //Get the tickers
 var tickers = await client.getTickers(symbol: BkSymbols.THB_BTC);
 //...
 print(tickers.tickerList.first.lastPrice);
```

Getting ask,bid orders

```dart
 //Initialize the client
 var client = BitkubClient();
 //Get the orders
 var orders = await client.getOpenOrders(BkSymbols.THB_BTC);
 //...
 print(orders.asks.first.quoteRate);
```

Connecting to trade stream

```dart
//Initialize the socket client
var socketClient = BitkubSocketClient();
//Get the stream of trade
var tradeStream = socketClient.connectToTradeStream([BkSymbols.THB_BTC]);
//Listen to matchedOrder change
tradeStream.listen((matchedOrder) {
	//...
    print(matchedOrder);
});
```
## Contribution

Before creating a new issues please read the official Bitkub API first for Breaking Changes.

Feel free to contribute and shot the pull requests!

## License

Mit
