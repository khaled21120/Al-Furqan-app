import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'home_grid_item.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 20,
          children: [
            HomeGridItem(
              title: 0,
              image: 0,
              height: 0,
              onTap: () {
                GoRouter.of(context).pushNamed(
                  'quranView',
                  extra: {'isAudio': false, 'index': 999},
                );
              },
            ),
            HomeGridItem(
              title: 2,
              image: 2,
              height: 2,
              onTap: () {
                GoRouter.of(context).pushNamed('prayerTime');
              },
            ),
            HomeGridItem(
              title: 4,
              image: 4,
              height: 4,
              onTap: () {
                GoRouter.of(context).pushNamed('sebha');
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 20,
          children: [
            HomeGridItem(
              title: 1,
              image: 1,
              height: 1,
              onTap: () {
                GoRouter.of(context).pushNamed('audioGrid');
              },
            ),
            HomeGridItem(
              title: 3,
              image: 3,
              height: 3,
              onTap: () {
                GoRouter.of(context).pushNamed('azkarCategories');
              },
            ),
            HomeGridItem(
              title: 5,
              image: 5,
              height: 5,
              onTap: () {
                GoRouter.of(context).pushNamed('hadeethCategories');
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}
