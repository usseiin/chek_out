import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

TextStyle priceTextStyle1() {
  return const TextStyle(
    fontSize: 22,
  );
}

TextStyle planOptionTextStyle() {
  return const TextStyle(
    color: CColor.ntext2,
    fontWeight: FontWeight.w400,
  );
}

TextStyle plansheadTextStyle2() {
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: CColor.ntext2,
  );
}

TextStyle plansPriceTextStyle() {
  return const TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    color: CColor.button,
  );
}

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
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),
        primary: CColor.button,
      ),
      child: Text(
        text,
        style: plansButtonTextStyle(),
      ),
    );
  }
}

TextStyle plansButtonTextStyle() {
  return const TextStyle(
    fontSize: 14,
    color: CColor.ntext1,
    fontWeight: FontWeight.w600,
  );
}
