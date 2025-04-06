import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:quran/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/services/get_it_service.dart';
import 'core/services/prefs_service.dart';
import 'core/themes/dark_theme.dart';
import 'core/themes/light_theme.dart';
import 'core/utils/app_routers.dart';
import 'features/home/Cubits/Theme Cubit/theme_cubit.dart';
import 'features/home/Cubits/Last Read Cubit/last_read_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await PrefsService.init();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Quran Playback',
    androidNotificationOngoing: true,
  );
  ThemeCubit themeCubit = ThemeCubit();
  themeCubit.loadTheme();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => themeCubit),
        BlocProvider(create: (_) => getIt.get<LastReadCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: lightThemeData,
          darkTheme: darkThemeData,
          themeMode: themeState.themeMode,
          routerConfig: AppRouters.router,
        );
      },
    );
  }
}
