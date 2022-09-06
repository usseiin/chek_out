import 'package:flutter/material.dart';

import 'features/appove_transaction/approve_transaction.dart';
import 'features/payment_address/screen/payment_address.dart';
import 'features/payment_screen/screens/payment_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PaymentScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const PaymentScreen(),
      );
    case PaymentAddressScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const PaymentAddressScreen(),
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
