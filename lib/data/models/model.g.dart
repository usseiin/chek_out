part of 'model.dart';

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ApiResponse',
      json,
      ($checkedConvert) {
        final val = ApiResponse(
          addresses: $checkedConvert('addresses',
              (v) => Addresses.fromJson(v as Map<String, dynamic>)),
          brandColor: $checkedConvert('brand_color', (v) => v as String),
          brandLogoUrl:
              $checkedConvert('brand_logo_url', (v) => Uri.parse(v as String)),
          code: $checkedConvert('code', (v) => v as String),
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
          description: $checkedConvert('description', (v) => v as String),
          exchangeRates: $checkedConvert('exchange_rates',
              (v) => ExchangeRates.fromJson(v as Map<String, dynamic>)),
          expiresAt:
              $checkedConvert('expires_at', (v) => DateTime.parse(v as String)),
          feeRate: $checkedConvert('fee_rate', (v) => (v as num).toDouble()),
          feeSettled: $checkedConvert('fee_settled', (v) => v as bool),
          hostedUrl:
              $checkedConvert('hosted_url', (v) => Uri.parse(v as String)),
          id: $checkedConvert('id', (v) => v as String),
          localExchangeRates: $checkedConvert('local_exchange_rates',
              (v) => LocalExchangeRates.fromJson(v as Map<String, dynamic>)),
          logoUrl: $checkedConvert('logo_url', (v) => Uri.parse(v as String)),
          metadata: $checkedConvert(
              'metadata', (v) => UserData.fromJson(v as Map<String, dynamic>)),
          name: $checkedConvert('name', (v) => v as String),
          offchainEligible:
              $checkedConvert('offchain_eligible', (v) => v as bool),
          organisationName:
              $checkedConvert('organisation_name', (v) => v as String),
          paymentThreshold: $checkedConvert('payment_threshold',
              (v) => PaymentThreshold.fromJson(v as Map<String, dynamic>)),
          payments: $checkedConvert('payments', (v) => v as List<dynamic>),
          pricing: $checkedConvert(
              'pricing', (v) => Pricing.fromJson(v as Map<String, dynamic>)),
          pricingType: $checkedConvert('pricing_type', (v) => v as String),
          pwcbOnly: $checkedConvert('pwcb_only', (v) => v as bool),
          supportEmail: $checkedConvert('support_email', (v) => v as String),
          timeline: $checkedConvert(
              'timeline', (v) => Timeline.fromJson(v as Map<String, dynamic>)),
          utxo: $checkedConvert('utxo', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {
        'brandColor': 'brand_color',
        'brandLogoUrl': 'brand_logo_url',
        'createdAt': 'created_at',
        'exchangeRates': 'exchange_rates',
        'expiresAt': 'expires_at',
        'feeRate': 'fee_rate',
        'feeSettled': 'fee_settled',
        'hostedUrl': 'hosted_url',
        'localExchangeRates': 'local_exchange_rates',
        'logoUrl': 'logo_url',
        'offchainEligible': 'offchain_eligible',
        'organisationName': 'organisation_name',
        'paymentThreshold': 'payment_threshold',
        'pricingType': 'pricing_type',
        'pwcbOnly': 'pwcb_only',
        'supportEmail': 'support_email'
      },
    );

Addresses _$AddressesFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Addresses',
      json,
      ($checkedConvert) {
        final val = Addresses(
          ethereum: $checkedConvert('ethereum', (v) => v as String),
          usdc: $checkedConvert('usdc', (v) => v as String),
          dai: $checkedConvert('dai', (v) => v as String),
          apecoin: $checkedConvert('apecoin', (v) => v as String),
          shibainu: $checkedConvert('shibainu', (v) => v as String),
          tether: $checkedConvert('tether', (v) => v as String),
          bitcoincash: $checkedConvert('bitcoincash', (v) => v as String),
          dogecoin: $checkedConvert('dogecoin', (v) => v as String),
          litecoin: $checkedConvert('litecoin', (v) => v as String),
          bitcoin: $checkedConvert('bitcoin', (v) => v as String),
        );
        return val;
      },
    );
Map<String, dynamic> _$AddressesToJson(Addresses instance) => <String, dynamic>{
      'ethereum': instance.ethereum,
      'usdc': instance.usdc,
      'dai': instance.dai,
      'apecoin': instance.apecoin,
      'shibainu': instance.shibainu,
      'tether': instance.tether,
      'bitcoincash': instance.bitcoincash,
      'dogecoin': instance.dogecoin,
      'litecoin': instance.litecoin,
      'bitcoin': instance.bitcoin,
    };

ExchangeRates _$ExchangeRatesFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ExchangeRates',
      json,
      ($checkedConvert) {
        final val = ExchangeRates(
          eth: $checkedConvert('ETH-USD', (v) => double.parse(v as String)),
          btc: $checkedConvert('BTC-USD', (v) => double.parse(v as String)),
          ltc: $checkedConvert('LTC-USD', (v) => double.parse(v as String)),
          doge: $checkedConvert('DOGE-USD', (v) => double.parse(v as String)),
          bch: $checkedConvert('BCH-USD', (v) => double.parse(v as String)),
          usdc: $checkedConvert('USDC-USD', (v) => double.parse(v as String)),
          dai: $checkedConvert('DAI-USD', (v) => double.parse(v as String)),
          ape: $checkedConvert('APE-USD', (v) => double.parse(v as String)),
          shib: $checkedConvert('SHIB-USD', (v) => double.parse(v as String)),
          usdt: $checkedConvert('USDT-USD', (v) => double.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'eth': 'ETH-USD',
        'btc': 'BTC-USD',
        'ltc': 'LTC-USD',
        'doge': 'DOGE-USD',
        'bch': 'BCH-USD',
        'usdc': 'USDC-USD',
        'dai': 'DAI-USD',
        'ape': 'APE-USD',
        'shib': 'SHIB-USD',
        'usdt': 'USDT-USD'
      },
    );

LocalExchangeRates _$LocalExchangeRatesFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LocalExchangeRates',
      json,
      ($checkedConvert) {
        final val = LocalExchangeRates(
          eth: $checkedConvert('ETH-USD', (v) => (v as num).toDouble()),
          btc: $checkedConvert('BTC-USD', (v) => (v as num).toDouble()),
          ltc: $checkedConvert('LTC-USD', (v) => (v as num).toDouble()),
          doge: $checkedConvert('DOGE-USD', (v) => (v as num).toDouble()),
          bch: $checkedConvert('BCH-USD', (v) => (v as num).toDouble()),
          usdc: $checkedConvert('USDC-USD', (v) => (v as num).toDouble()),
          dai: $checkedConvert('DAI-USD', (v) => (v as num).toDouble()),
          ape: $checkedConvert('APE-USD', (v) => (v as num).toDouble()),
          shib: $checkedConvert('SHIB-USD', (v) => (v as num).toDouble()),
          usdt: $checkedConvert('USDT-USD', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'eth': 'ETH-USD',
        'btc': 'BTC-USD',
        'ltc': 'LTC-USD',
        'doge': 'DOGE-USD',
        'bch': 'BCH-USD',
        'usdc': 'USDC-USD',
        'dai': 'DAI-USD',
        'ape': 'APE-USD',
        'shib': 'SHIB-USD',
        'usdt': 'USDT-USD'
      },
    );

UserData _$UserDataFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserData',
      json,
      ($checkedConvert) {
        final val = UserData(
          id: $checkedConvert('id', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
        );
        return val;
      },
    );

PaymentThreshold _$PaymentThresholdFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PaymentThreshold',
      json,
      ($checkedConvert) {
        final val = PaymentThreshold(
          overpaymentAbsoluteThreshold: $checkedConvert(
              'overpayment_absolute_threshold',
              (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
          overpaymentRelativeThreshold: $checkedConvert(
              'overpayment_relative_threshold', (v) => (v as num).toDouble()),
          underpaymentAbsoluteThreshold: $checkedConvert(
              'underpayment_absolute_threshold',
              (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
          underpaymentRelativeThreshold: $checkedConvert(
              'underpayment_relative_threshold', (v) => (v as num).toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'overpaymentAbsoluteThreshold': 'overpayment_absolute_threshold',
        'overpaymentRelativeThreshold': 'overpayment_relative_threshold',
        'underpaymentAbsoluteThreshold': 'underpayment_absolute_threshold',
        'underpaymentRelativeThreshold': 'underpayment_relative_threshold'
      },
    );

AmountCurrency _$AmountCurrencyFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AmountCurrency',
      json,
      ($checkedConvert) {
        final val = AmountCurrency(
          amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
          currency: $checkedConvert('currency', (v) => v as String),
        );
        return val;
      },
    );

Pricing _$PricingFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Pricing',
      json,
      ($checkedConvert) {
        final val = Pricing(
          local: $checkedConvert('local',
              (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
          ethereum: $checkedConvert('ethereum',
              (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
          usdc: $checkedConvert('usdc',
              (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
          dai: $checkedConvert(
              'dai', (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
          apecoin: $checkedConvert('apecoin',
              (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
          shibainu: $checkedConvert('shibainu',
              (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
          tether: $checkedConvert('tether',
              (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
          bitcoincash: $checkedConvert('bitcoincash',
              (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
          dogecoin: $checkedConvert('dogecoin',
              (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
          litecoin: $checkedConvert('litecoin',
              (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
          bitcoin: $checkedConvert('bitcoin',
              (v) => AmountCurrency.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Timeline _$TimelineFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Timeline',
      json,
      ($checkedConvert) {
        final val = Timeline(
          timeStatus: $checkedConvert(
              'time_status',
              (v) => (v as List<dynamic>)
                  .map((e) => TimeStatus.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'timeStatus': 'time_status'},
    );

TimeStatus _$TimeStatusFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TimeStatus',
      json,
      ($checkedConvert) {
        final val = TimeStatus(
          status: $checkedConvert('status', (v) => v as String),
          time: $checkedConvert('time', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );
