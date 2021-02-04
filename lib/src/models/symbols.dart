import '../helper.dart';

///Enums for Bitkub symbol sign
///Ex. THB_BTC indicates THB <-> BTC
enum BkSymbols {
  THB_ABT,
  THB_ADA,
  THB_BAND,
  THB_BAT,
  THB_BCH,
  THB_BNB,
  THB_BSV,
  THB_BTC,
  THB_CVC,
  THB_DAI,
  THB_DOGE,
  THB_DOT,
  THB_ETH,
  THB_EVX,
  THB_GNT,
  THB_INF,
  THB_IOST,
  THB_JFIN,
  THB_KNC,
  THB_KSM,
  THB_LINK,
  THB_LTC,
  THB_MANA,
  THB_NEAR,
  THB_OMG,
  THB_POW,
  THB_RDN,
  THB_SIX,
  THB_SNT,
  THB_USDC,
  THB_USDT,
  THB_WAN,
  THB_XLM,
  THB_XRP,
  THB_ZIL,
  THB_ZRX,
}

///Extensions on BkSymbols
extension BkSymbolsExtension on BkSymbols {
  ///Short symbol name
  ///Ex. BTC
  String get name => bkSymbolsValue.reverse[this].split('_').last;

  ///Symbol string
  ///Ex. THB_ABT
  String get symbolString => bkSymbolsValue.reverse[this];
}

///@nodoc
const bkSymbolsValue = EnumValues({
  'THB_ABT': BkSymbols.THB_ABT,
  'THB_ADA': BkSymbols.THB_ADA,
  'THB_BAND': BkSymbols.THB_BAND,
  'THB_BAT': BkSymbols.THB_BAT,
  'THB_BCH': BkSymbols.THB_BCH,
  'THB_BNB': BkSymbols.THB_BNB,
  'THB_BSV': BkSymbols.THB_BSV,
  'THB_BTC': BkSymbols.THB_BTC,
  'THB_CVC': BkSymbols.THB_CVC,
  'THB_DAI': BkSymbols.THB_DAI,
  'THB_DOGE': BkSymbols.THB_DOGE,
  'THB_DOT': BkSymbols.THB_DOT,
  'THB_ETH': BkSymbols.THB_ETH,
  'THB_EVX': BkSymbols.THB_EVX,
  'THB_GNT': BkSymbols.THB_GNT,
  'THB_INF': BkSymbols.THB_INF,
  'THB_IOST': BkSymbols.THB_IOST,
  'THB_JFIN': BkSymbols.THB_JFIN,
  'THB_KNC': BkSymbols.THB_KNC,
  'THB_KSM': BkSymbols.THB_KSM,
  'THB_LINK': BkSymbols.THB_LINK,
  'THB_LTC': BkSymbols.THB_LTC,
  'THB_MANA': BkSymbols.THB_MANA,
  'THB_NEAR': BkSymbols.THB_NEAR,
  'THB_OMG': BkSymbols.THB_OMG,
  'THB_POW': BkSymbols.THB_POW,
  'THB_RDN': BkSymbols.THB_RDN,
  'THB_SIX': BkSymbols.THB_SIX,
  'THB_SNT': BkSymbols.THB_SNT,
  'THB_USDC': BkSymbols.THB_USDC,
  'THB_USDT': BkSymbols.THB_USDT,
  'THB_WAN': BkSymbols.THB_WAN,
  'THB_XLM': BkSymbols.THB_XLM,
  'THB_XRP': BkSymbols.THB_XRP,
  'THB_ZIL': BkSymbols.THB_ZIL,
  'THB_ZRX': BkSymbols.THB_ZRX,
});
