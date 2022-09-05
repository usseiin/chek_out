import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../widgets/widgets.dart';

class BasicPlanScreen extends StatelessWidget {
  const BasicPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'For medium size teams to \ncreate projects plans',
            style: priceTextStyle1(),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                '\$35',
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
          const PricingButton(text: 'Get Started'),
          const SizedBox(height: 20),
          ...List.generate(
            basicList.length,
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
                    basicList[index],
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
