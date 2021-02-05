import 'dart:convert';

import 'package:meta/meta.dart';

///An OpenOrders object that contains bids and asks of specific BkSymbols
///Used in BitkubClient
class BkOpenOrders {
  const BkOpenOrders({
    @required this.error,
    @required this.bids,
    @required this.asks,
  }) : assert(bids != null && asks != null);

  ///Error code when initiated
  final int error;

  ///List of bids
  final List<BkOrder> bids;

  ///List of asks
  final List<BkOrder> asks;

  ///Return true if has no error
  bool get isOk => error == null || error != 0;

  factory BkOpenOrders.fromJson(String str) =>
      BkOpenOrders._fromMap(json.decode(str));

  factory BkOpenOrders._fromMap(Map<String, dynamic> json) => BkOpenOrders(
        error: json['errors'],
        bids: (json['result']['bids'] as List<dynamic>)
            .map((e) => BkOrder.fromList(e))
            .toList(),
        asks: (json['result']['asks'] as List<dynamic>)
            .map((e) => BkOrder.fromList(e))
            .toList(),
      );
}

///A BkOrder object that contains various order information
///Used in BkOpenOrders
class BkOrder {
  const BkOrder({
    @required this.id,
    @required this.timestamp,
    @required this.baseVolume,
    @required this.quoteVolume,
    @required this.quoteRate,
  });
  //Numerial id
  final int id;

  ///Timestamp when [this] order has been placed
  final DateTime timestamp;

  ///Volume of [this] in currency
  ///Ex. 0.0029816 (BTC)
  final double baseVolume;

  ///Volume of [this] in THB
  ///Ex. 3200.50 (THB)
  final double quoteVolume;

  ///Rate of [this] that ask or bid in THB
  ///Ex. 1103996.99
  final double quoteRate;

  //factory BkOrder.fromJson(String str) =>
  //BkOrder._fromList(json.decode(str)['results']);

  factory BkOrder.fromList(List<dynamic> list) => BkOrder(
        id: list[0],
        timestamp: DateTime.fromMillisecondsSinceEpoch(list[1] * 1000),
        quoteVolume: list[2].toDouble(),
        quoteRate: list[3].toDouble(),
        baseVolume: list[4].toDouble(),
      );
}
