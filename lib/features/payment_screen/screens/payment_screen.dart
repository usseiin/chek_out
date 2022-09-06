// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chekout_app/features/payment_address/screen/payment_address.dart';

import '../../../constants/constants.dart';
import '../../../models/model.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/top_bar.dart';

class PaymentScreen extends StatefulWidget {
  static const String routeName = 'payment-screen';
  const PaymentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedPayModeOption;

  bool toExpand = false;

  String? payMode;

  bool isTAndCSelected = false;

  void setPayMode(val) {
    setState(() {
      selectedPayModeOption = val;
    });
  }

  void agreed() {
    setState(() {
      isTAndCSelected = !isTAndCSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final SelectStream selectStream = SelectStream();
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
                  minHeight: MediaQuery.of(context).size.height - 96),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      PayModeOption(
                        text: 'Cryptocurrency',
                        onClicked: setPayMode,
                        selectedPayModeOption: selectedPayModeOption,
                        items: cryptoList,
                      ),
                      const Divider(thickness: 5),
                      PayModeOption(
                        text: 'Credit Card',
                        onClicked: setPayMode,
                        selectedPayModeOption: selectedPayModeOption,
                        items: creditCardList,
                      ),
                      const Divider(thickness: 5),
                      PayModeOption(
                        text: 'Debit Card',
                        onClicked: setPayMode,
                        selectedPayModeOption: selectedPayModeOption,
                        items: debitCardList,
                      ),
                      const Divider(thickness: 5),
                      PayModeOption(
                        text: 'Bank Transfer',
                        onClicked: setPayMode,
                        selectedPayModeOption: selectedPayModeOption,
                        items: const [],
                      ),
                      const Divider(thickness: 5),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: agreed,
                            child: (isTAndCSelected == false)
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
                      ),
                    ],
                  ),
                  // const SizedBox(height: 75),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(fontSize: 22),
                              ),
                              StreamBuilder<UserValue>(
                                stream: selectStream.valueStream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final value =
                                        (snapshot.data as UserValue).amount;
                                    print('has value');
                                    return Text(
                                      '$value USD',
                                      style: const TextStyle(fontSize: 22),
                                    );
                                  }
                                  return const CircularProgressIndicator();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Amount in BTC',
                                style: TextStyle(fontSize: 22),
                              ),
                              Text(
                                '0.0034BTC',
                                style: TextStyle(fontSize: 22),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: 'Proceed to your payment',
                        onClicked: () {
                          Navigator.pushNamed(
                            context,
                            PaymentAddressScreen.routeName,
                          );
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

class CryptoTypeContainer extends StatelessWidget {
  const CryptoTypeContainer({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                leading: items[index]['logo'],
                title: Text(
                  '${items[index]['name']}(${items[index]['symbol'] ?? ''})',
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class PayModeOption extends StatelessWidget {
  const PayModeOption({
    Key? key,
    required this.text,
    required this.onClicked,
    this.items,
    required this.selectedPayModeOption,
  }) : super(key: key);
  final String text;
  final Function onClicked;
  final List<dynamic>? items;
  final String? selectedPayModeOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          leading: Radio(
            activeColor: CColor.select,
            value: text,
            groupValue: 'payment-mode',
            onChanged: (val) => onClicked(val),
          ),
          title: Text(text),
          trailing: (items != null)
              ? SizedBox(
                  width: 120,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          items!.length,
                          (index) => items![index]['logo'],
                        ),
                      ],
                    ),
                  ),
                )
              : null,
        ),
        if (selectedPayModeOption == text && items!.isNotEmpty)
          CryptoTypeContainer(
            items: items!,
          ),
      ],
    );
  }
}
