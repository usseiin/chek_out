import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class PlansTypeButton extends StatelessWidget {
  const PlansTypeButton({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.position,
    required this.selectedIndex,
  }) : super(key: key);
  final String text;
  final Function onClicked;
  final int position;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onClicked(position) ?? {},
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: CColor.border),
            color: position == selectedIndex ? CColor.select : null,
            borderRadius: position == 1
                ? const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    bottomLeft: Radius.circular(26),
                  )
                : position == 3
                    ? const BorderRadius.only(
                        topRight: Radius.circular(26),
                        bottomRight: Radius.circular(26),
                      )
                    : null,
          ),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (position == selectedIndex)
                const Icon(
                  Icons.check,
                  size: 16,
                ),
              Text(
                text,
                style: const TextStyle(
                  color: CColor.ntext2,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
