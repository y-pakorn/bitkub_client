///Enums to indicate whether the matched order is buy or sell order
///Used in BkMatchedOrder
enum BkType { BUY, SELL, NaN }

///Extentions on BkMatchedOrder
extension BkMatchedOrderTypeExtension on BkType {
  String get string {
    switch (this) {
      case BkType.BUY:
        return 'BUY';
      case BkType.SELL:
        return 'SELL';
      case BkType.NaN:
        return '';
      default:
        return '';
    }
  }
}
