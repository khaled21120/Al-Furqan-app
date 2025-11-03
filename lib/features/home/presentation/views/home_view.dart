import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

import '../../../../core/themes/text_style.dart';
import '../widgets/home_appbar.dart';
import '../widgets/home_grid_view.dart';
import '../widgets/last_read.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppbar(
              openDrawer: () => scaffoldKey.currentState?.openDrawer(),
            ),
            const LastRead(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text('الشائعة', style: MyStyle.title25(context)),
            ),
            const SizedBox(height: 20),
            const HomeGridView(),
          ],
        ),
      ),
    );
  }
}
