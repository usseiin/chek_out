// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:chekout_app/data/repository/repository.dart';
import 'package:chekout_app/services/bloc/payment_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constants.dart';
import 'widgets/custom_button.dart';
import 'widgets/top_bar.dart';
import 'payment_address.dart';
import 'widgets/payment_mode.dart';

class PaymentScreen extends StatelessWidget {
  static const String routeName = 'payment-screen';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        height: 60,
        title: 'Select a mode of payment',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      PayModeOption(
                        text: 'Cryptocurrency',
                        items: cryptoList,
                      ),
                      const Divider(thickness: 5),
                      PayModeOption(
                        text: 'Credit Card',
                        items: creditCardList,
                      ),
                      const Divider(thickness: 5),
                      PayModeOption(
                        text: 'Debit Card',
                        items: debitCardList,
                      ),
                      const Divider(thickness: 5),
                      PayModeOption(
                        text: 'Bank Transfer',
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
                                log("object ${state.isTandC}");
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total',
                                style: TextStyle(fontSize: 22),
                              ),
                              Text(
                                'price USD',
                                style: TextStyle(fontSize: 22),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          BlocBuilder<AppStateCubit, AppState>(
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Amount in USD',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  Text(
                                    "5 USD",
                                    style: TextStyle(fontSize: 22),
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
                          if (context.read<AppStateCubit>().state.isTandC) {
                            Navigator.pushNamed(
                              context,
                              PaymentAddressScreen.routeName,
                              arguments: Details(
                                address: 'treeyuiiooppkjhh',
                                paymentUrl: Uri.parse('jjjhhhggyyggggf'),
                                time: DateTime(2022),
                                amount: 3.4,
                              ),
                            );
                          }
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
