import 'package:chekout_app/features/payment_screen/screens/payment_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../widgets/widgets.dart';

class PremiumPlanScreen extends StatelessWidget {
  const PremiumPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int price = 80;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('For large size teams to achieve greatness together',
              style: priceTextStyle1()),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                '\$$price',
                style: plansPriceTextStyle(),
              ),
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.credit_card,
                size: 40,
              ),
              const SizedBox(width: 50),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'PER USER X PER MONTH',
            style: plansheadTextStyle2(),
          ),
          const SizedBox(height: 20),
          PricingButton(
            text: 'Get Started',
            onClicked: () {
              Navigator.pushNamed(
                context,
                PaymentScreen.routeName,
                arguments: 80,
              );
            },
          ),
          const SizedBox(height: 20),
          ...List.generate(
            premiumList.length,
            (index) => SizedBox(
              height: 30,
              child: Row(
                children: [
                  const Icon(
                    Icons.check,
                    size: 20,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    premiumList[index],
                    style: planOptionTextStyle(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
