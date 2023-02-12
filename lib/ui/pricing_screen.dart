import 'package:chekout_app/services/bloc/payment_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/enum/pricing_plan.dart';
import 'widgets/top_bar.dart';
import 'plan_container.dart';
import 'widgets/plans_type_button.dart';

class PricingScreen extends StatelessWidget {
  const PricingScreen({Key? key}) : super(key: key);

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
          child: BlocBuilder<AppStateCubit, AppState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PlansTypeButton(
                          position: 1,
                          state: state,
                          func: (val) =>
                              context.read<AppStateCubit>().change(val),
                          plan: PricingPlan.free,
                        ),
                        PlansTypeButton(
                          position: 2,
                          state: state,
                          func: (val) =>
                              context.read<AppStateCubit>().change(val),
                          plan: PricingPlan.basic,
                        ),
                        PlansTypeButton(
                          position: 3,
                          state: state,
                          func: (val) =>
                              context.read<AppStateCubit>().change(val),
                          plan: PricingPlan.premium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: BlocProvider.value(
                      value: BlocProvider.of<AppStateCubit>(context),
                      child: PlanScreenContainer(
                        contxt: context,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
