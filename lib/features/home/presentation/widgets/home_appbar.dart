import 'package:flutter/material.dart';
import 'package:quran/core/themes/text_style.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key, required this.openDrawer});
  final VoidCallback openDrawer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: openDrawer,
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Text('الفرقان', style: MyStyle.title25(context)),
          Container(),
        ],
      ),
    );
  }
}
