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
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    context.read<AppStateCubit>().updateScreen('bitcoin');
                  },
                  leading: Image.asset(
                    items[index]['logo'],
                    height: 24,
                    width: 24,
                  ),
                  title: Text(
                    '${items[index]['name']}${items[index]['symbol'] != null ? '(${items[index]['symbol']})' : ""}',
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class PayModeOption extends StatelessWidget {
  const PayModeOption({
    Key? key,
    required this.text,
    this.items,
  }) : super(key: key);
  final String text;
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
              value: text,
              groupValue: state.selectedPaymentOption,
              onChanged: (String? val) {
                if (val != null) {
                  context
                      .read<AppStateCubit>()
                      .updateSelectedPaymentOption(val);
                }
              },
            );
          }),
          title: Text(text),
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
            if (state.selectedPaymentOption == text && items!.isNotEmpty) {
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
