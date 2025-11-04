import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/text_style.dart';
import '../../cubit/theme_cubit/theme_cubit.dart';

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        bool isDarkMode = state.themeMode == ThemeMode.dark;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الوضع الداكن', style: MyStyle.title20(context)),
                Switch.adaptive(
                  activeColor: Theme.of(context).colorScheme.onTertiary,
                  inactiveThumbColor: Theme.of(context).colorScheme.primary,
                  value: isDarkMode,
                  onChanged: (value) {
                    context.read<ThemeCubit>().toggleTheme(
                      value ? ThemeMode.dark : ThemeMode.light,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
