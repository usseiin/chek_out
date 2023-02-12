import 'package:chekout_app/constants/constants.dart';
import 'package:chekout_app/services/enum/payment_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/bloc/payment_screen_bloc.dart';

class CryptoTypeContainer extends StatelessWidget {
  const CryptoTypeContainer({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List items;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppStateCubit(),
      child: Column(
        children: [
          ...items
              .map((item) => ListTile(
                    selectedColor: CColor.select,
                    onTap: () {
                      context
                          .read<AppStateCubit>()
                          .updateScreen(item["name"].toString().toLowerCase());
                    },
                    leading: Image.asset(
                      item['logo'],
                      height: 24,
                      width: 24,
                    ),
                    title: Text(
                      '${item['name']}${item['symbol'] != null ? '(${item['symbol']})' : ""}',
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }
}

class PayModeOption extends StatelessWidget {
  const PayModeOption({
    Key? key,
    required this.mode,
    this.items,
  }) : super(key: key);
  final PaymentMode mode;
  final List<dynamic>? items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          leading:
              BlocBuilder<AppStateCubit, AppState>(builder: (context, state) {
            return Radio(
              value: mode.title,
              groupValue: state.selectedPaymentOption?.title,
              onChanged: (String? val) {
                if (val != null) {
                  context
                      .read<AppStateCubit>()
                      .updateSelectedPaymentOption(mode);
                }
              },
            );
          }),
          title: Text(mode.title),
          trailing: (items != null)
              ? SizedBox(
                  width: 130,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          items!.length,
                          (index) => Image.asset(
                            items![index]['logo'],
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
        ),
        BlocBuilder<AppStateCubit, AppState>(
          builder: (context, state) {
            if (state.selectedPaymentOption == mode && items!.isNotEmpty) {
              return CryptoTypeContainer(items: items!);
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    );
  }
}
