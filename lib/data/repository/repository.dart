// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chekout_app/data/models/api_client.dart';
import 'package:chekout_app/models/pay_details.dart';

class Details {
  final String address;
  final Uri paymentUrl;
  final DateTime time;
  final double amount;
  Details({
    required this.address,
    required this.paymentUrl,
    required this.time,
    required this.amount,
  });
}

class DataRepository {
  DataRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;

  Future<Details> getPaymentDetail(PayDetails details) async {
    final result = await _apiClient.getPaymentDetails(details);

    return Details(
      address: result.addresses.bitcoin,
      paymentUrl: result.hostedUrl,
      time: result.expiresAt,
      amount: result.pricing.bitcoin.amount,
    );
  }

  Future<RateSymbol> getRate(String? details) async {
    final result = await _apiClient.getRate(details);

    return RateSymbol(
      symbol: result.symbol,
      rate: result.rateUsd,
    );
  }
}

class RateSymbol {
  final String symbol;
  final double rate;
  RateSymbol({
    required this.symbol,
    required this.rate,
  });

  RateSymbol copyWith({
    String? symbol,
    double? rate,
  }) {
    return RateSymbol(
      symbol: symbol ?? this.symbol,
      rate: rate ?? this.rate,
    );
  }
}
