import 'package:chekout_app/data/repository/repository.dart';
import 'package:chekout_app/services/bloc/payment_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/approve_transaction.dart';
import 'ui/payment_address.dart';
import 'ui/payment_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PaymentScreen.routeName:
      // final price = settings.arguments as int;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => BlocProvider(
          create: (_) => AppStateCubit(),
          child: const PaymentScreen(
              // price: price,
              ),
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
