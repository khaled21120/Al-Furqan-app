import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran/features/home/Cubits/Translation%20Cubit/translation_cubit.dart';
import 'package:quran/features/home/Cubits/Azkar%20Cubit/azkar_cubit.dart';
import 'package:quran/features/home/presentation/views/Azkar/azkar_category_view.dart';
import 'package:quran/features/home/presentation/views/Azkar/azkar_view.dart';
import 'package:quran/features/home/presentation/views/search_view.dart';
import 'package:quran/features/home/presentation/views/Sebha%20and%20Prayer%20Time/sebha_view.dart';
import 'package:quran/features/home/presentation/views/Surahs/surah_translation_view.dart';
import '../../features/home/Cubits/Hadeeth%20Cubit/hadeeth_cubit.dart';
import '../../features/home/Cubits/Prayer%20Cubit/prayer_cubit.dart';
import '../../features/home/Cubits/Sebha Cubit/sebha_cubit.dart';
import '../../features/home/Cubits/Surah Cuibit/surah_cubit.dart';
import '../../features/home/data/models/surah_model.dart';
import '../../features/home/presentation/views/about_me_view.dart';
import '../../features/home/presentation/views/Audio/audio_grid.dart';
import '../../features/home/presentation/views/Audio/audio_view.dart';
import '../../features/home/presentation/views/Hadeeths/hadeeth_categories_view.dart';
import '../../features/home/presentation/views/Hadeeths/hadeeth_details_view.dart';
import '../../features/home/presentation/views/Hadeeths/hadeeths_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/Sebha and Prayer Time/prayer_time_view.dart';
import '../../features/home/presentation/views/Surahs/quran_view.dart';
import '../../features/home/presentation/views/Surahs/surah_details_view.dart';
import '../../features/splash/presentation/splash_page.dart';
import '../services/get_it_service.dart';

abstract class AppRouters {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, _) => const SplashPage()),
      GoRoute(path: '/home', name: 'home', builder: (_, _) => const HomeView()),
      GoRoute(
        path: "/details",
        name: "surahDetailsView",
        builder: (_, state) {
          final surah = state.extra as SurahModel;
          return BlocProvider(
            create:
                (_) => getIt.get<SurahCubit>()..getAyah(path: surah.number!),
            child: SurahDetailsView(ayahModel: surah),
          );
        },
      ),
      GoRoute(
        path: '/quran',
        name: 'quranView',
        builder: (_, state) {
          final data =
              state.extra as Map<String, dynamic>; // Extract data as Map
          final boolen = data['isAudio'] as bool;
          final index = data['index'] as int;
          final title = data['title'] as String?;
          return BlocProvider(
            create: (_) => getIt.get<SurahCubit>()..getSurah(),
            child: QuranView(isAudio: boolen, index: index, title: title),
          );
        },
      ),
      GoRoute(
        path: '/audio',
        name: 'audioPlayer',
        builder: (_, state) {
          final extras =
              state.extra as Map<String, dynamic>; 
          final surah = extras['surah'] as SurahModel;
          final endPoint = extras['endPoint'] as String;
          final name = extras['name'] as String;
          return AudioView(name: name, surahModel: surah, endPoint: endPoint);
        },
      ),
      GoRoute(
        path: '/grid',
        name: 'audioGrid',
        builder: (_, _) => const AudioGrid(),
      ),
      GoRoute(
        path: '/aboutMe',
        name: 'aboutMe',
        builder: (_, _) => const AboutMeView(),
      ),
      GoRoute(
        path: '/prayer',
        name: 'prayerTime',
        builder:
            (_, _) => BlocProvider(
              create: (_) => getIt.get<PrayerCubit>(),
              child: const PrayerTimeView(),
            ),
      ),
      GoRoute(
        path: '/hadeethCategories',
        name: 'hadeethCategories',
        builder:
            (_, _) => BlocProvider(
              create: (_) => getIt.get<HadeethCubit>()..getHadeethCategories(),
              child: const HadeethCategoriesView(),
            ),
      ),
      GoRoute(
        path: '/hadeeths',
        name: 'hadeeths',
        builder: (_, state) {
          final extras = state.extra as Map<String, dynamic>;
          final path = extras['id'] as String;
          final title = extras['title'] as String;
          return BlocProvider(
            create:
                (context) => getIt.get<HadeethCubit>()..getHadeeths(path: path),
            child: HadeethsView(title: title),
          );
        },
      ),
      GoRoute(
        path: '/hadeethDetails',
        name: 'hadeethDetails',
        builder: (_, state) {
          final extras = state.extra as Map<String, dynamic>;
          final path = extras['id'] as String;
          final title = extras['title'] as String;
          return BlocProvider(
            create:
                (_) => getIt.get<HadeethCubit>()..getHadeethDetails(path: path),
            child: HadeethDetailsView(title: title),
          );
        },
      ),
      GoRoute(
        path: '/surahTranslation',
        name: 'surahTranslation',
        builder: (_, state) {
          final extras = state.extra as Map<String, dynamic>;
          final path = extras['id'] as int;
          final title = extras['title'] as String;
          return BlocProvider(
            create:
                (_) =>
                    getIt.get<TranslationCubit>()
                      ..getSurahTranslation(surahID: path),
            child: SurahTranslationView(surahName: title),
          );
        },
      ),
      GoRoute(
        path: '/azkarCategories',
        name: 'azkarCategories',
        builder: (_, _) => const AzkarCategoryView(),
      ),
      GoRoute(
        path: '/sebha',
        name: 'sebha',
        builder:
            (_, _) => BlocProvider(
              create: (context) => CounterCubit(),
              child: const SebhaView(),
            ),
      ),
      GoRoute(
        path: '/search',
        name: 'search',
        builder:
            (_, _) => BlocProvider(
              create: (context) => getIt.get<SurahCubit>()..getSurah(),
              child: const SearchView(),
            ),
      ),
      GoRoute(
        path: '/azkar',
        name: 'azkar',
        builder: (_, state) {
          final extras =
              state.extra as Map<String, String?>; // Extract data as Map
          final title = extras['title'] as String;
          final id = extras['id'] as String;
          return BlocProvider(
            create:
                (context) => getIt.get<AzkarCubit>()..fetchAzkar(azkarType: id),
            child: AzkarView(title: title, id: id),
          );
        },
      ),
    ],
  );
}
