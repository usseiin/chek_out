import 'package:chekout_app/features/pricing_screen/screens/pricing_screen.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';
import 'route.dart';

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
        backgroundColor: CColor.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: CColor.topbar,
          elevation: 0,
          iconTheme: IconThemeData(
            color: CColor.title,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const PricingScreen(),
    );
  }
}
