import 'package:chekout_app/data/repository/repository.dart';
import 'package:flutter/material.dart';

import 'ui/approve_transaction.dart';
import 'ui/payment_address.dart';
import 'ui/payment_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PaymentScreen.routeName:
      final contxt = settings.arguments as BuildContext;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => PaymentScreen(
          contxt: contxt,
        ),
      );
    case PaymentAddressScreen.routeName:
      final details = settings.arguments as Details;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => PaymentAddressScreen(
          details: details,
        ),
      );
    case ApproveTransactionScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const ApproveTransactionScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) {
          return const MaterialApp(
            home: Scaffold(
              body: Text("Page doesn't exit"),
            ),
          );
        },
      );
  }
}
