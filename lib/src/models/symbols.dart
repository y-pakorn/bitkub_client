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
  THB_SCRT,
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

  ///Full symbol name
  ///Ex. Ethereum
  String get fullName {
    switch (this) {
      case BkSymbols.THB_ABT:
        return 'Arcblock';
        break;
      case BkSymbols.THB_ADA:
        return 'Cardano';
        break;
      case BkSymbols.THB_BAND:
        return 'Band Protocol';
        break;
      case BkSymbols.THB_BAT:
        return 'Basic Attention Token';
        break;
      case BkSymbols.THB_BCH:
        return 'Bitcoin Cash';
        break;
      case BkSymbols.THB_BNB:
        return 'Binance Coin';
        break;
      case BkSymbols.THB_BSV:
        return 'Bitcoin SV';
        break;
      case BkSymbols.THB_BTC:
        return 'Bitcoin';
        break;
      case BkSymbols.THB_CVC:
        return 'Civic';
        break;
      case BkSymbols.THB_DAI:
        return 'Dai';
        break;
      case BkSymbols.THB_DOGE:
        return 'Dogecoin';
        break;
      case BkSymbols.THB_DOT:
        return 'Polkadot';
        break;
      case BkSymbols.THB_ETH:
        return 'Ethereum';
        break;
      case BkSymbols.THB_EVX:
        return 'Everex';
        break;
      case BkSymbols.THB_GNT:
        return 'Golem Network Token';
        break;
      case BkSymbols.THB_INF:
        return 'Infinitus';
        break;
      case BkSymbols.THB_IOST:
        return 'IOST';
        break;
      case BkSymbols.THB_JFIN:
        return 'JFIN';
        break;
      case BkSymbols.THB_KNC:
        return 'Kyber Network';
        break;
      case BkSymbols.THB_KSM:
        return 'Kusama';
        break;
      case BkSymbols.THB_LINK:
        return 'Chainlink';
        break;
      case BkSymbols.THB_LTC:
        return 'Litecoin';
        break;
      case BkSymbols.THB_MANA:
        return 'Decentraland';
        break;
      case BkSymbols.THB_NEAR:
        return 'NEAR Protocol';
        break;
      case BkSymbols.THB_OMG:
        return 'OMG Network';
        break;
      case BkSymbols.THB_POW:
        return 'EOS Pow Coin';
        break;
      case BkSymbols.THB_RDN:
        return 'Raiden Network Token';
        break;
      case BkSymbols.THB_SIX:
        return 'SIX';
        break;
      case BkSymbols.THB_SCRT:
        return 'Secret';
        break;
      case BkSymbols.THB_SNT:
        return 'Status';
        break;
      case BkSymbols.THB_USDC:
        return 'USD Coin';
        break;
      case BkSymbols.THB_USDT:
        return 'Tether USD';
        break;
      case BkSymbols.THB_WAN:
        return 'Wanchain';
        break;
      case BkSymbols.THB_XLM:
        return 'Stella';
        break;
      case BkSymbols.THB_XRP:
        return 'XRP';
        break;
      case BkSymbols.THB_ZIL:
        return 'Zilliqa';
        break;
      case BkSymbols.THB_ZRX:
        return '0x';
        break;
      default:
        return name;
    }
  }
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
  'THB_SCRT': BkSymbols.THB_SCRT,
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
