import 'package:chekout_app/services/bloc/payment_screen_bloc.dart';
import 'package:chekout_app/ui/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constants.dart';
import '../services/enum/pricing_plan.dart';
import 'widgets/pricing_button.dart';
import 'widgets/text_style.dart';

class PlanScreenContainer extends StatelessWidget {
  const PlanScreenContainer({super.key, required this.contxt});

  final BuildContext contxt;

  @override
  Widget build(BuildContext context) {
    PricingPlan plan = contxt.read<AppStateCubit>().state.plan;
    String card = plan == PricingPlan.free ? "no-card.png" : "card.png";
    String title = plan == PricingPlan.free
        ? "For individuals personal use or teams"
        : plan == PricingPlan.basic
            ? "For medium size teams to \ncreate projects plans"
            : "For large size teams to achieve greatness together";

    String duration =
        plan == PricingPlan.free ? "For Life" : "PER USER X PER MONTH";
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: priceTextStyle1(),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                '\$${plan.price}',
                style: plansPriceTextStyle(),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Image.asset('$imgPath/$card'),
              const SizedBox(width: 25),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            duration,
            style: plansheadTextStyle2(),
          ),
          const SizedBox(height: 20),
          PricingButton(
            text: 'Get Started',
            onClicked: () {
              context.read<AppStateCubit>().resetSelected();
              Navigator.pushNamed(context, PaymentScreen.routeName,
                  arguments: context);
            },
          ),
          const SizedBox(height: 20),
          ...List.generate(
            plan.list.length,
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
                    plan.list[index],
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
