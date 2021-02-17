import 'dart:convert';

import './type.dart';
import 'package:meta/meta.dart';

///A [BkTradeList] object that contains list of [BkTradeInfo]
///Used in [BitkubClient]
class BkTradeList {
  const BkTradeList({
    this.error,
    @required this.trades,
  }) : assert(trades != null);

  ///Error code when initiated
  final int error;

  ///List of trades
  final List<BkTradeInfo> trades;

  ///Return true if has no error
  bool get isOk => error == null || error == 0;

  factory BkTradeList.fromJson(String str) =>
      BkTradeList._fromMap(json.decode(str));

  factory BkTradeList._fromMap(Map<String, dynamic> json) => BkTradeList(
        error: json['error'],
        trades: (json['result'] as List<dynamic>)
            .map((e) => BkTradeInfo._fromList(e))
            .toList()
              ..removeWhere((e) => e == null),
      );
}

///A [BkTradeInfo] object that contains various information about the trade
///Used in [BkTradeList],
class BkTradeInfo {
  BkTradeInfo({
    @required this.timestamp,
    @required this.type,
    @required this.quoteVolume,
    @required this.quoteRate,
  });

  ///Timestamp when trade occurs
  final DateTime timestamp;

  ///Get order type of [this], can be BkType.BUY or BkType.SELL
  final BkType type;

  ///Volume of [this] in THB
  ///Ex. 3200.50 (THB)
  final double quoteVolume;

  ///Rate of [this] in THB
  ///Ex. 1103996.99
  final double quoteRate;

  factory BkTradeInfo._fromList(List<dynamic> list) => BkTradeInfo(
        timestamp: DateTime.fromMillisecondsSinceEpoch(list[0] * 1000),
        quoteRate: list[1].toDouble(),
        quoteVolume: list[2].toDouble(),
        type: list[3] == 'BUY'
            ? BkType.BUY
            : list[3] == 'SELL'
                ? BkType.SELL
                : BkType.NaN,
      );
}
