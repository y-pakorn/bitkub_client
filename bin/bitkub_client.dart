import 'client.dart';

void main(List<String> arguments) async {
  var client = BitkubClient();
  var tickers = await client.getTickers();
  print(tickers.tickerList.first.symbol);
}
