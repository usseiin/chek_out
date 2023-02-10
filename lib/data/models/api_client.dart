// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'dart:developer';

import 'package:chekout_app/data/models/rate_api.dart';
import 'package:http/http.dart' as http;

import 'package:chekout_app/data/models/model.dart';

import '../../models/pay_details.dart';

class ApiNotFoundFailure implements Exception {}

class ApiRequestFailure implements Exception {}

class RateRequestFailureException implements Exception {}

class RateNotFoundException implements Exception {}

class ApiClient {
  ApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();
  final http.Client _httpClient;

  Future<ApiResponse> getPaymentDetails(PayDetails details) async {
    log('loading');
    http.Response response = await _httpClient.post(
      Uri.http('0.0.0.0:5000', 'boy-recipe-app/us-central1/createCharge'),
      body: details.toJson(),
    );

    log('after response');

    if (response.statusCode != 200) {
      log('error request failure');
      throw ApiRequestFailure();
    }

    final result = jsonDecode(response.body) as Map<String, dynamic>;

    if (result.isEmpty) {
      log('error empty');

      throw ApiNotFoundFailure();
    }

    return ApiResponse.fromJson(result);
  }

//https://api.coincap.io/v2/rates
  Future<RateApi> getRate(query) async {
    http.Response response = await _httpClient.get(
      Uri.https(
        'api.coincap.io',
        'v2/rates/$query',
      ),
    );

    if (response.statusCode != 200) {
      throw RateRequestFailureException();
    }

    final rate = (jsonDecode(response.body) as Map<String, dynamic>);
    log("$rate");

    if (rate['data'] == null) {
      throw RateNotFoundException();
    }

    return RateApi.fromMap(rate['data']);
  }
}
