// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

Map<String, dynamic> result = {
  "addresses": {
    "ethereum": "0xe699e157524173896614c7b5a45a020bb66c99ca",
    "usdc": "0xe699e157524173896614c7b5a45a020bb66c99ca",
    "dai": "0xe699e157524173896614c7b5a45a020bb66c99ca",
    "apecoin": "0xe699e157524173896614c7b5a45a020bb66c99ca",
    "shibainu": "0xe699e157524173896614c7b5a45a020bb66c99ca",
    "tether": "0xe699e157524173896614c7b5a45a020bb66c99ca",
    "bitcoincash": "qzfldamxtyqwp2cpgwgjzwdhs87vgtpcyqn7wgvn5d",
    "dogecoin": "DE13Ei3WjxgS9hopkt2iNLpGa1A2xFVYUy",
    "litecoin": "ME1K9MvbVK7QmXKTybeTbgr35w9ukExkeP",
    "bitcoin": "33bZiZxT9p2FBvZHrJWde1qAfGGdaM3WZ3",
  },
  "brand_color": "#122332",
  "brand_logo_url": "",
  "code": "Q7HDGM5K",
  "created_at": "2022-09-13T06:22:48Z",
  "description": "Useless widget created by Fireship",
  "exchange_rates": {
    "ETH-USD": "1723.13",
    "BTC-USD": "22410.38",
    "LTC-USD": "61.7",
    "DOGE-USD": "0.063645",
    "BCH-USD": "129.125",
    "USDC-USD": "1.0",
    "DAI-USD": "1.00005",
    "APE-USD": "5.637",
    "SHIB-USD": "0.000012845",
    "USDT-USD": "1.000195",
  },
  "expires_at": "2022-09-13T07:22:48Z",
  "fee_rate": 0.01,
  "fees_settled": true,
  "hosted_url": "https://commerce.coinbase.com/charges/Q7HDGM5K",
  "id": "4802d4e3-ce98-40a2-8f33-568bfeacf55a",
  "local_exchange_rates": {
    "ETH-USD": "1723.13",
    "BTC-USD": "22410.38",
    "LTC-USD": "61.7",
    "DOGE-USD": "0.063645",
    "BCH-USD": "129.125",
    "USDC-USD": "1.0",
    "DAI-USD": "1.00005",
    "APE-USD": "5.637",
    "SHIB-USD": "0.000012845",
    "USDT-USD": "1.000195",
  },
  "logo_url": "",
  "metadata": {
    "user": "jeffd23",
  },
  "name": "Widget",
  "offchain_eligible": false,
  "organization_name": "",
  "payment_threshold": {
    "overpayment_absolute_threshold": {
      "amount": "5.00",
      "currency": "USD",
    },
    "overpayment_relative_threshold": "0.005",
    "underpayment_absolute_threshold": {
      "amount": "5.00",
      "currency": "USD",
    },
    "underpayment_relative_threshold": "0.005",
  },
  "payments": [],
  "pricing": {
    "local": {
      "amount": "9.99",
      "currency": "USD",
    },
    "ethereum": {
      "amount": "0.005798000",
      "currency": "ETH",
    },
    "usdc": {
      "amount": "9.990000",
      "currency": "USDC",
    },
    "dai": {
      "amount": "9.989500524973751312",
      "currency": "DAI",
    },
    "apecoin": {
      "amount": "1.772219265566790846",
      "currency": "APE",
    },
    "shibainu": {
      "amount": "777734.527053326580000000",
      "currency": "SHIB",
    },
    "tether": {
      "amount": "9.988052",
      "currency": "USDT",
    },
    "bitcoincash": {
      "amount": "0.07736689",
      "currency": "BCH",
    },
    "dogecoin": {
      "amount": "156.96441198",
      "currency": "DOGE",
    },
    "litecoin": {
      "amount": "0.16191248",
      "currency": "LTC",
    },
    "bitcoin": {
      "amount": "0.00044578",
      "currency": "BTC",
    },
  },
  "pricing_type": "fixed_price",
  "pwcb_only": false,
  "resource": "charge",
  "support_email": "sirkenny.hk@gmail.com",
  "timeline": [
    {
      "status": "NEW",
      "time": "2022-09-13T06:22:49Z",
    }
  ],
  "utxo": false,
};

class ApiResponse {
  final Addresses addresses;
  final String brandColor;
  final Uri brandLogoUrl;
  final String code;
  final DateTime createdAt;
  final String description;
  final ExchangeRates exchangeRates;
  final DateTime expiresAt;
  final double feeRate;
  final bool feeSettled;
  final Uri hostedUrl;
  final String id;
  final LocalExchangeRates localExchangeRates;
  final Uri logoUrl;
  final UserData metadata;
  final String name;
  final bool offchainEligible;
  final String organisationName;
  final PaymentThreshold paymentThreshold;
  final List payments;
  final Pricing pricing;
  final String pricingType;
  final bool pwcbOnly;
  final String supportEmail;
  final Timeline timeline;
  final bool utxo;
  ApiResponse({
    required this.addresses,
    required this.brandColor,
    required this.brandLogoUrl,
    required this.code,
    required this.createdAt,
    required this.description,
    required this.exchangeRates,
    required this.expiresAt,
    required this.feeRate,
    required this.feeSettled,
    required this.hostedUrl,
    required this.id,
    required this.localExchangeRates,
    required this.logoUrl,
    required this.metadata,
    required this.name,
    required this.offchainEligible,
    required this.organisationName,
    required this.paymentThreshold,
    required this.payments,
    required this.pricing,
    required this.pricingType,
    required this.pwcbOnly,
    required this.supportEmail,
    required this.timeline,
    required this.utxo,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}

class Addresses {
  final String ethereum;
  final String usdc;
  final String dai;
  final String apecoin;
  final String shibainu;
  final String tether;
  final String bitcoincash;
  final String dogecoin;
  final String litecoin;
  final String bitcoin;
  Addresses({
    required this.ethereum,
    required this.usdc,
    required this.dai,
    required this.apecoin,
    required this.shibainu,
    required this.tether,
    required this.bitcoincash,
    required this.dogecoin,
    required this.litecoin,
    required this.bitcoin,
  });
  factory Addresses.fromJson(Map<String, dynamic> json) =>
      _$AddressesFromJson(json);

  Map<String, dynamic> toJson() => _$AddressesToJson(this);
}

class ExchangeRates {
  final double eth;
  @JsonKey(name: "BTC-USD")
  final double btc;
  @JsonKey(name: "LTC-USD")
  final double ltc;
  @JsonKey(name: "DOGE-USD")
  final double doge;
  @JsonKey(name: "BCH-USD")
  final double bch;
  @JsonKey(name: "USDC-USD")
  final double usdc;
  @JsonKey(name: "DAI-USD")
  final double dai;
  @JsonKey(name: "APE-USD")
  final double ape;
  @JsonKey(name: "SHIB-USD")
  final double shib;
  @JsonKey(name: "USDT-USD")
  final double usdt;
  ExchangeRates({
    required this.eth,
    required this.btc,
    required this.ltc,
    required this.doge,
    required this.bch,
    required this.usdc,
    required this.dai,
    required this.ape,
    required this.shib,
    required this.usdt,
  });

  factory ExchangeRates.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRatesFromJson(json);
}

class LocalExchangeRates {
  @JsonKey(name: "ETH-USD")
  final double eth;
  @JsonKey(name: "BTC-USD")
  final double btc;
  @JsonKey(name: "LTC-USD")
  final double ltc;
  @JsonKey(name: "DOGE-USD")
  final double doge;
  @JsonKey(name: "BCH-USD")
  final double bch;
  @JsonKey(name: "USDC-USD")
  final double usdc;
  @JsonKey(name: "DAI-USD")
  final double dai;
  @JsonKey(name: "APE-USD")
  final double ape;
  @JsonKey(name: "SHIB-USD")
  final double shib;
  @JsonKey(name: "USDT-USD")
  final double usdt;
  LocalExchangeRates({
    required this.eth,
    required this.btc,
    required this.ltc,
    required this.doge,
    required this.bch,
    required this.usdc,
    required this.dai,
    required this.ape,
    required this.shib,
    required this.usdt,
  });
  factory LocalExchangeRates.fromJson(Map<String, dynamic> json) =>
      _$LocalExchangeRatesFromJson(json);
}

class UserData {
  final String id;
  final String email;
  UserData({
    required this.id,
    required this.email,
  });
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

class PaymentThreshold {
  final AmountCurrency overpaymentAbsoluteThreshold;
  final double overpaymentRelativeThreshold;
  final AmountCurrency underpaymentAbsoluteThreshold;
  final double underpaymentRelativeThreshold;
  PaymentThreshold({
    required this.overpaymentAbsoluteThreshold,
    required this.overpaymentRelativeThreshold,
    required this.underpaymentAbsoluteThreshold,
    required this.underpaymentRelativeThreshold,
  });
  factory PaymentThreshold.fromJson(Map<String, dynamic> json) =>
      _$PaymentThresholdFromJson(json);
}

class AmountCurrency {
  final double amount;
  final String currency;
  AmountCurrency({
    required this.amount,
    required this.currency,
  });
  factory AmountCurrency.fromJson(Map<String, dynamic> json) =>
      _$AmountCurrencyFromJson(json);
}

class Pricing {
  final AmountCurrency local;
  final AmountCurrency ethereum;
  final AmountCurrency usdc;
  final AmountCurrency dai;
  final AmountCurrency apecoin;
  final AmountCurrency shibainu;
  final AmountCurrency tether;
  final AmountCurrency bitcoincash;
  final AmountCurrency dogecoin;
  final AmountCurrency litecoin;
  final AmountCurrency bitcoin;
  Pricing({
    required this.local,
    required this.ethereum,
    required this.usdc,
    required this.dai,
    required this.apecoin,
    required this.shibainu,
    required this.tether,
    required this.bitcoincash,
    required this.dogecoin,
    required this.litecoin,
    required this.bitcoin,
  });
  factory Pricing.fromJson(Map<String, dynamic> json) =>
      _$PricingFromJson(json);
}

class Timeline {
  List<TimeStatus> timeStatus;
  Timeline({
    required this.timeStatus,
  });
  factory Timeline.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);
}

class TimeStatus {
  final String status;
  final DateTime time;
  TimeStatus({
    required this.status,
    required this.time,
  });
  factory TimeStatus.fromJson(Map<String, dynamic> json) =>
      _$TimeStatusFromJson(json);
}
