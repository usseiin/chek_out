import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/constants.dart';
import 'route.dart';
import 'services/bloc/payment_screen_bloc.dart';
import 'ui/pricing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: CColor.topbar,
          elevation: 0,
          iconTheme: IconThemeData(
            color: CColor.title,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: BlocProvider(
        create: (context) => AppStateCubit(),
        child: const PricingScreen(),
      ),
    );
  }
}
