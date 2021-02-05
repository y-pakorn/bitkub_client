import 'dart:convert';

import './symbols.dart';

import 'package:meta/meta.dart';

///A MatchedOrder object that contains various inforation about matched order
///Used in BitkubSocketClient
class BkMatchedOrder {
  BkMatchedOrder({
    @required this.quoteRate,
    @required this.streamName,
    @required this.transactionId,
    @required this.symbol,
    @required this.timestamp,
    @required this.amount,
    @required this.buyOrderId,
    @required this.sellOrderId,
    //@required this.rawJson,
  });

  ///Parsed stream name in string
  ///Ex. market.trade.thb_doge
  final String streamName;

  ///Transaction id of [this]
  ///Contains currency, sell/buy type and id
  ///Ex. DOGEBUY0001411101
  final String transactionId;

  ///Symbol of [this]
  final BkSymbols symbol;

  ///Timestamp of [this] when fullfilled
  final DateTime timestamp;

  ///Amount of which has been fullfilled in THB
  ///Ex. 3330
  final double amount;

  ///Buy order id
  final int buyOrderId;

  ///Sell order id
  final int sellOrderId;

  ///Rate of [this] that got fullfilled in THB
  ///Ex. 1103996.99
  final double quoteRate;

  //final Map<String, dynamic> rawJson;

  ///Get order type of [this], can be BkMatchedOrderType.BUY or BkMatchedOrderType.SELL
  BkMatchedOrderType get orderType => transactionId.contains('BUY')
      ? BkMatchedOrderType.BUY
      : BkMatchedOrderType.SELL;

  factory BkMatchedOrder.fromJson(String str) =>
      BkMatchedOrder._fromMap(json.decode(str));

  factory BkMatchedOrder._fromMap(Map<String, dynamic> json) => BkMatchedOrder(
        symbol: bkSymbolsValue.map[json['sym']],
        amount: json['amt'].toDouble(),
        timestamp: DateTime.fromMillisecondsSinceEpoch(json['ts'] * 1000),
        streamName: json['stream'],
        buyOrderId: json['bid'],
        sellOrderId: json['sid'],
        quoteRate: json['rat'].toDouble(),
        transactionId: json['txn'],
        //rawJson: json,
      );
}

///Enums to indicate whether the matched order is buy or sell order
///Used in BkMatchedOrder
enum BkMatchedOrderType { BUY, SELL }

///Extentions on BkMatchedOrder
extension BkMatchedOrderTypeExtension on BkMatchedOrderType {
  String get string {
    switch (this) {
      case BkMatchedOrderType.BUY:
        return 'BUY';
      case BkMatchedOrderType.SELL:
        return 'SELL';
      default:
        return '';
    }
  }
}
