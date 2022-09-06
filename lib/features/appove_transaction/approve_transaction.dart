import 'package:chekout_app/constants/constants.dart';
import 'package:chekout_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/top_bar.dart';

class ApproveTransactionScreen extends StatelessWidget {
  const ApproveTransactionScreen({Key? key}) : super(key: key);
  static const String routeName = 'approve-transaction-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        height: 56,
        title: 'Approve this transaction',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Text(
              //   'Loading bitcoin wallet',
              //   style: TextStyle(
              //     fontSize: 22,
              //     fontWeight: FontWeight.w400,
              //     color: CColor.dtext,
              //   ),
              // ),
              // // SizedBox(
              // //   height: 100,
              // //   width: double.infinity,
              // // ),
              // // CircularProgressIndicator(),

              //
              // const SizedBox(
              //   height: 40,
              //   width: double.infinity,
              // ),
              // const Text(
              //   '0.0034BTC',
              //   style: TextStyle(fontSize: 36),
              // ),
              // const SizedBox(height: 16),
              // const Text('To'),
              // const SizedBox(height: 16),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   height: 40,
              //   alignment: Alignment.center,
              //   color: CColor.topbar,
              //   child: const Text('43645589hfhvte83dyr3dtt59i5utgff78'),
              // ),
              // const SizedBox(height: 26),
              // const Text('Fee: 0.00000245686BTC (8.00USD)'),
              // const SizedBox(height: 56),
              // CustomButton(
              //   text: 'Approve this transaction',
              //   onClicked: () {},
              // ),

              //
              const SizedBox(height: 35),
              const Text(
                'Your transfer of 0.0034BTC\ninto the BTC wallet address was\nSuccessful!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  color: CColor.select,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: const Icon(
                  Icons.check,
                  size: 40,
                ),
              ),
              const SizedBox(height: 100),
              CustomButton(
                text: 'Done',
                onClicked: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
