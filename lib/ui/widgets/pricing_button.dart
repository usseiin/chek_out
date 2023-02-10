import 'package:chekout_app/ui/widgets/text_style.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class PricingButton extends StatelessWidget {
  const PricingButton({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  final String text;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: CColor.button,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),
      ),
      child: Text(
        text,
        style: plansButtonTextStyle(),
      ),
    );
  }
}
