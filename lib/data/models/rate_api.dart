import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RateApi {
  final String id;
  final String symbol;
  final String currencySymbol;
  final String currencyType;
  final double rateUsd;
  RateApi({
    required this.id,
    required this.symbol,
    required this.currencySymbol,
    required this.currencyType,
    required this.rateUsd,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'symbol': symbol,
      'currencySymbol': currencySymbol,
      'type': currencyType,
      'rateUsd': rateUsd,
    };
  }

  factory RateApi.fromMap(Map<String, dynamic> map) {
    return RateApi(
      id: map['id'] as String,
      symbol: map['symbol'] as String,
      currencySymbol: (map['currencySymbol'] ?? map['symbol']) as String,
      currencyType: map['type'] as String,
      rateUsd: double.parse(map['rateUsd']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RateApi.fromJson(String source) =>
      RateApi.fromMap(json.decode(source) as Map<String, dynamic>);
}
