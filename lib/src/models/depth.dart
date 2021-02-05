import 'dart:convert';

import 'package:meta/meta.dart';

///A Depth object that contains bids and asks of specific BkSymbols
///Initialy sorted by lastest time
///Used in BitkubClient
class BkDepth {
  BkDepth({
    @required this.error,
    @required this.bids,
    @required this.asks,
  }) : assert(bids != null && asks != null);

  ///Error code when initiated
  final int error;

  ///List of bids
  final List<BkDepthValue> bids;

  ///List of asks
  final List<BkDepthValue> asks;

  ///Return true if has no error
  bool get isOk => error == null || error != 0;

  factory BkDepth.fromJson(String str) => BkDepth._fromMap(json.decode(str));

  factory BkDepth._fromMap(Map<String, dynamic> json) => BkDepth(
        error: json['error'],
        bids: (json['bids'] as List<dynamic>)
            .map((e) => BkDepthValue._fromList(e))
            .toList(),
        asks: (json['asks'] as List<dynamic>)
            .map((e) => BkDepthValue._fromList(e))
            .toList(),
      );
}

///A DepthValue object that contains depth information
///Used in BkDepth
class BkDepthValue {
  BkDepthValue(this.quoteRate, this.baseVolume);

  ///Rate of [this] that ask or bid in THB
  ///Ex. 1103996.99
  final double quoteRate;

  ///Volume of [this] in currency
  ///Ex. 0.0029816 (BTC)
  final double baseVolume;

  factory BkDepthValue._fromList(List<dynamic> list) => BkDepthValue(
        (list[0]).toDouble(),
        (list[1]).toDouble(),
      );
}
