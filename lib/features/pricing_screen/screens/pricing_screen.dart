import 'package:flutter/material.dart';

import '../../../widgets/top_bar.dart';
import '../widgets/basic_plan.dart';
import '../widgets/free_plan_screen.dart';
import '../widgets/plans_type_button.dart';
import '../widgets/premium_screen.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({Key? key}) : super(key: key);

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  int selectedIndex = 1;

  void changeIndex(int val) {
    setState(() {
      selectedIndex = val;
    });
  }

  final List<Widget> _body = [
    const FreePlanScreen(),
    const BasicPlanScreen(),
    const PremiumPlanScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Our pricing plans',
        height: 60,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlansTypeButton(
                      text: 'Free',
                      onClicked: changeIndex,
                      position: 1,
                      selectedIndex: selectedIndex,
                    ),
                    PlansTypeButton(
                      text: 'Basic',
                      onClicked: changeIndex,
                      position: 2,
                      selectedIndex: selectedIndex,
                    ),
                    PlansTypeButton(
                      text: 'Premium',
                      onClicked: changeIndex,
                      position: 3,
                      selectedIndex: selectedIndex,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(child: _body[selectedIndex - 1]),
            ],
          ),
        ),
      ),
    );
  }
}
