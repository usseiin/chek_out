// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chekout_app/data/repository/repository.dart';
import 'package:chekout_app/services/bloc/payment_screen_bloc.dart';
import 'package:chekout_app/services/enum/payment_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constants.dart';
import 'widgets/custom_button.dart';
import 'widgets/top_bar.dart';
import 'payment_address.dart';
import 'widgets/payment_mode.dart';

class PaymentScreen extends StatelessWidget {
  static const String routeName = 'payment-screen';
  const PaymentScreen({super.key, required this.contxt});

  final BuildContext contxt;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AppStateCubit>(contxt),
      child: Scaffold(
        appBar: const CustomAppBar(
          height: 60,
          title: 'Select a mode of payment',
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height - 255),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 10),
                              PayModeOption(
                                mode: PaymentMode.cryptocurrency,
                                items: cryptoList,
                              ),
                              const Divider(thickness: 5),
                              PayModeOption(
                                mode: PaymentMode.creditCard,
                                items: creditCardList,
                              ),
                              const Divider(thickness: 5),
                              PayModeOption(
                                mode: PaymentMode.debitCard,
                                items: debitCardList,
                              ),
                              const Divider(thickness: 5),
                              PayModeOption(
                                mode: PaymentMode.bankTransfer,
                                items: bankTransfer,
                              ),
                              const Divider(thickness: 5),
                              const SizedBox(height: 20),
                              BlocBuilder<AppStateCubit, AppState>(
                                  // stream: null,
                                  builder: (context, state) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        context
                                            .read<AppStateCubit>()
                                            .toggleTermAndCondition();
                                      },
                                      child: (state.isTandC == false)
                                          ? const Icon(Icons.square_outlined)
                                          : const Icon(
                                              Icons.check_box,
                                              color: CColor.select,
                                            ),
                                    ),
                                    const SizedBox(width: 18),
                                    const Expanded(
                                      child: Text(
                                        'I have read and agree with this website terms and conditions.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(fontSize: 22),
                            ),
                            BlocBuilder<AppStateCubit, AppState>(
                                builder: (context, state) {
                              return Text(
                                '${state.plan.price} USD',
                                style: const TextStyle(fontSize: 22),
                              );
                            })
                          ],
                        ),
                        const SizedBox(height: 10),
                        BlocBuilder<AppStateCubit, AppState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Amount in ${state.rateSymbol.symbol}',
                                  style: const TextStyle(fontSize: 22),
                                ),
                                Text(
                                  "${context.read<AppStateCubit>().convertedRate} ${state.rateSymbol.symbol}",
                                  style: const TextStyle(fontSize: 22),
                                )
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: 'Proceed to your payment',
                      onClicked: () async {
                        if (contxt.read<AppStateCubit>().state.isTandC) {
                          if (contxt
                                  .read<AppStateCubit>()
                                  .state
                                  .selectedPaymentOption ==
                              PaymentMode.cryptocurrency) {
                            // final result = await context
                            //     .read<AppStateCubit>()
                            //     .getPaymebtDetails();
                            Navigator.pushNamed(
                              context,
                              PaymentAddressScreen.routeName,
                              arguments: Details(
                                address: 'treeyuiiooppkjhh',
                                paymentUrl: Uri.parse('www.fb.com'),
                                time: DateTime.now(),
                                amount: 3.4,
                              ),
                            );
                          }
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
