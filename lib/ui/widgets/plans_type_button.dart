import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../services/bloc/payment_screen_bloc.dart';
import '../../services/enum/pricing_plan.dart';

class PlansTypeButton extends StatelessWidget {
  const PlansTypeButton({
    Key? key,
    required this.position,
    required this.state,
    required this.func,
    required this.plan,
  }) : super(key: key);

  final int position;
  final AppState state;
  final Function func;
  final PricingPlan plan;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => func(plan),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: CColor.border),
            color: plan == state.plan ? CColor.select : null,
            borderRadius: position == 1
                ? const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    bottomLeft: Radius.circular(26),
                  )
                : position == 3
                    ? const BorderRadius.only(
                        topRight: Radius.circular(26),
                        bottomRight: Radius.circular(26),
                      )
                    : null,
          ),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.plan == plan)
                const Icon(
                  Icons.check,
                  size: 16,
                ),
              Text(
                plan.title,
                style: const TextStyle(
                  color: CColor.ntext2,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
