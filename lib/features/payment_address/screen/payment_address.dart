import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../widgets/top_bar.dart';

class PaymentAddressScreen extends StatelessWidget {
  static const String routeName = 'payment-address-screen';

  const PaymentAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String amount = '';
    const String address = '';

    return Scaffold(
      appBar: const CustomAppBar(height: 56, title: 'Select a mode of payment'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Kindly make drect transfer of ${amount}BTC into the BTC wallet address below',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                        address.isEmpty
                            ? '43645589hfhvte83dyr3dtt59i5utgff78'
                            : address,
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
                const SizedBox(
                  child: Icon(
                    Icons.qr_code,
                    size: 200,
                  ),
                ),

                //
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

                //
                //const SizedBox(height: 40),
                // const CircularProgressIndicator(),
                // const SizedBox(height: 30),
                // const Text('Waiting for your payment (02:23:02)'),
                // const Expanded(child: SizedBox()),
                // CustomButton(
                //   text: 'Proceed to your payment',
                //   onClicked: () {
                //     Navigator.pushNamed(
                //       context,
                //       ApproveTransactionScreen.routeName,
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
