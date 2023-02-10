import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.height,
    required this.title,
  }) : super(key: key);

  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: CColor.title),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            color: CColor.title,
          ),
        ),
      ],
      // bottom: TabBar(
      //   tabs: [
      //     Text('tab1'),
      //     Text('tab1'),
      //     Text('tab1'),
      //   ],controller: TabController(length: 3, vsync: this),
      // ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
