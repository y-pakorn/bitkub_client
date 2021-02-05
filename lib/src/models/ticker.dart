import 'dart:convert';
import 'package:meta/meta.dart';

import './symbols.dart';

///A BkTickerList object that store list of BkTicker
///Used in BitkubClient
class BkTickerList {
  const BkTickerList(this.tickerList, {this.error});

  ///Error code when initiated
  final int error;

  ///List of ticker, might be empty
  final List<BkTicker> tickerList;

  ///Return one BkTicker in [tickerList] that symbol is [symbol]
  BkTicker getSpecificTicker(BkSymbols symbol) =>
      tickerList.firstWhere((e) => e.symbol == symbol);

  ///Return true if has no error
  bool get isOk => error == null || error != 0;

  factory BkTickerList.fromJson(String str) =>
      BkTickerList._fromMap(json.decode(str));

  factory BkTickerList._fromMap(Map<String, dynamic> json) {
    return BkTickerList(
      json.entries
          .where((entry) => entry.key != 'error')
          .map((entry) => BkTicker._fromMap(entry.key, entry.value))
          .toList(),
      error: json['error'],
    );
  }
}

///A BkTicker object that contains various ticker information
///Used in BkTickerList
class BkTicker {
  const BkTicker({
    @required this.change,
    @required this.prevClose,
    @required this.prevOpen,
    @required this.symbol,
    @required this.id,
    @required this.lastPrice,
    @required this.lowestAsk,
    @required this.highestBid,
    @required this.percentChange,
    @required this.allBaseVolume,
    @required this.allQuoteVolume,
    @required this.high24Hr,
    @required this.low24Hr,
    @required this.isFrozen,
  });

  ///Symbol of [this]
  ///Ex. BkSymbols.THB_BTC
  final BkSymbols symbol;

  ///Numerical id
  final int id;

  ///Lastest price that been sold in THB
  ///Ex. 1120000
  final double lastPrice;

  ///Lowest price that has been asked in THB
  ///Ex. 1120840
  final double lowestAsk;

  ///Highest price that has been bid in THB
  ///Ex. 1110090
  final double highestBid;

  ///Percentage change in 24 hours, may be negative
  ///Ex. 2.81
  final double percentChange;

  ///Currency value change when open/close in yesterday in THB, may be negative
  ///Ex. -1499
  final double change;

  ///Yesterday closing price in THB
  final double prevClose;

  ///Yesterday opening price in THB
  final double prevOpen;

  ///Base volume of [this] combined in currency
  ///Ex. 667.81 (BTC)
  final double allBaseVolume;

  ///Base volume of [this] combined in THB
  ///Ex. 774519219.63 (THB)
  final double allQuoteVolume;

  ///Highest price in 24 hours in THB
  ///Ex. 1137929
  final double high24Hr;

  ///Lowest price in 24 hours in THB
  ///Ex. 1127929
  final double low24Hr;

  ///Is this currency frozen, i.e. Not available for trade
  ///Ex. false
  final bool isFrozen;

  factory BkTicker._fromMap(String key, Map<String, dynamic> json) => BkTicker(
        symbol: bkSymbolsValue.map[key],
        id: json['id'],
        low24Hr: (json['low24hr']).toDouble(),
        high24Hr: (json['high24hr']).toDouble(),
        lastPrice: (json['last']).toDouble(),
        lowestAsk: (json['lowestAsk']).toDouble(),
        highestBid: (json['highestBid']).toDouble(),
        percentChange: (json['percentChange']).toDouble(),
        allBaseVolume: (json['baseVolume']).toDouble(),
        allQuoteVolume: (json['quoteVolume']).toDouble(),
        isFrozen: json['isFrozen'] == 1 ? true : false,
        change: (json['change']).toDouble(),
        prevOpen: (json['prevOpen']).toDouble(),
        prevClose: (json['prevOpen']).toDouble(),
      );
}
