import 'package:chekout_app/constants/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class FreePlanScreen extends StatelessWidget {
  const FreePlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int price = 0;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'For individuals personal use or teams',
            style: priceTextStyle1(),
          ),
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
            'FOR LIFE',
            style: plansheadTextStyle2(),
          ),
          const SizedBox(height: 20),
          PricingButton(
            text: 'Free for life',
            onClicked: () {},
          ),
          const SizedBox(height: 20),
          ...List.generate(
            freeList.length,
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
                    freeList[index],
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
