import 'dart:convert';

import '../data/models/model.dart';

class PayDetails {
  final String productName;
  final String description;
  final AmountCurrency localPrice;
  final UserData userData;
  final String pricingType;

  PayDetails({
    required this.productName,
    required this.description,
    required this.localPrice,
    required this.userData,
    required this.pricingType,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": productName,
      "description": description,
      "local_price": {
        "amount": localPrice.amount,
        "currency": localPrice.currency,
      },
      "pricing_type": pricingType,
      "metadata": {
        "email": userData.email,
      },
    };
  }

  // factory

  String toJson() => jsonEncode(toMap());
}
