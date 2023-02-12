import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../constants/constants.dart';
import '../data/repository/repository.dart';
import 'widgets/custom_button.dart';
import 'widgets/top_bar.dart';
import 'approve_transaction.dart';

class PaymentAddressScreen extends StatefulWidget {
  static const String routeName = 'payment-address-screen';

  final Details details;

  const PaymentAddressScreen({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  State<PaymentAddressScreen> createState() => _PaymentAddressScreenState();
}

class _PaymentAddressScreenState extends State<PaymentAddressScreen> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 56, title: 'Select a mode of payment'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height - 96),
              child: Column(
                children: [
                  Text(
                    'Kindly make direct transfer of ${(widget.details.amount)}BTC into the BTC wallet address below',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 40,
                    alignment: Alignment.center,
                    color: CColor.topbar,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.details.address.isEmpty
                              ? '43645589hfhvte83dyr3dtt59i5utgff78'
                              : widget.details.address,
                        ),
                        const Icon(Icons.copy),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Or\nscan this QR code below',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 36),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: QrImage(
                      data: '${widget.details.paymentUrl}',
                      size: 195,
                    ),
                  ),

                  //

                  (isLoading == true)
                      ? Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                              const Text('Waiting for your payment (02:23:02)'),
                              const SizedBox(height: 40),
                              CustomButton(
                                text: 'Proceed to your payment',
                                onClicked: () async {
                                  isLoading = await Navigator.pushNamed(
                                    context,
                                    ApproveTransactionScreen.routeName,
                                  ) as bool;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text('Transaction authenticated'),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  color: CColor.select,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                alignment: Alignment.center,
                                height: 32,
                                width: 32,
                                child: const Icon(
                                  Icons.check,
                                  size: 16,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'You can now manage your team effectively\nin one place with our project\nmanagement tools ',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
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
