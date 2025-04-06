import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/themes/text_style.dart';
import 'theme_toggle_switch.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          spacing: 30,
          children: [
            // Drawer Header
            DrawerHeader(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text('الفرقان', style: MyStyle.title28(context)),
            ),

            // Toggle Theme Button
            const ThemeToggleSwitch(),

            const Spacer(),
            // About Me Button
            Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  title: Text('عن التطبيق', style: MyStyle.title20(context)),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pop(context);
                    GoRouter.of(context).pushNamed('aboutMe');
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
