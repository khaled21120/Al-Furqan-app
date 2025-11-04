import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/cubit/hadeeth_cubit/hadeeth_cubit.dart';
import '../../features/home/cubit/prayer_cubit/prayer_cubit.dart';
import '../../features/home/cubit/sebha_cubit/sebha_cubit.dart';
import '../../features/home/cubit/surah_cuibit/surah_cubit.dart';
import '../../features/home/cubit/translation_cubit/translation_cubit.dart';
import '../../features/home/cubit/azkar_cubit/azkar_cubit.dart';
import '../../features/home/presentation/views/azkar/azkar_category_view.dart';
import '../../features/home/presentation/views/azkar/azkar_view.dart';
import '../../features/home/presentation/views/search_view.dart';
import '../../features/home/presentation/views/sebha_view.dart';
import '../../features/home/presentation/views/surahs/surah_translation_view.dart';
import '../../features/home/data/models/surah_model.dart';
import '../../features/home/presentation/views/about_me_view.dart';
import '../../features/home/presentation/views/audio/audio_grid.dart';
import '../../features/home/presentation/views/audio/audio_view.dart';
import '../../features/home/presentation/views/hadeeths/hadeeth_categories_view.dart';
import '../../features/home/presentation/views/hadeeths/hadeeth_details_view.dart';
import '../../features/home/presentation/views/hadeeths/hadeeths_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/views/prayer_time/prayer_time_view.dart';
import '../../features/home/presentation/views/surahs/quran_view.dart';
import '../../features/home/presentation/views/surahs/surah_details_view.dart';
import '../../features/splash/presentation/splash_page.dart';
import '../services/get_it_service.dart';

abstract class AppRouters {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, _) => const SplashPage()),
      GoRoute(path: '/home', name: 'home', builder: (_, _) => const HomeView()),
      GoRoute(
        path: "/surahDetailsView/:id",
        name: "surahDetailsView",
        builder: (_, state) {
          final id = state.pathParameters['id']!;
          return BlocProvider(
            create: (_) => getIt.get<SurahCubit>()..getAyah(id: int.parse(id)),
            child: const SurahDetailsView(),
          );
        },
      ),
      GoRoute(
        path: '/quran',
        name: 'quranView',
        builder: (_, state) {
          final data = state.extra as Map<String, dynamic>;
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
          final extras = state.extra as Map<String, dynamic>;
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
        path: '/hadeeths/:id',
        name: 'hadeeths',
        builder: (_, state) {
          final title = state.extra as String;
          return BlocProvider(
            create:
                (_) =>
                    getIt.get<HadeethCubit>()
                      ..getHadeeths(id: state.pathParameters['id'] as String),
            child: HadeethsView(title: title),
          );
        },
      ),
      GoRoute(
        path: '/hadeethDetails/:id',
        name: 'hadeethDetails',
        builder: (_, state) {
          final title = state.extra as String;
          return BlocProvider(
            create:
                (_) =>
                    getIt.get<HadeethCubit>()..getHadeethDetails(
                      id: state.pathParameters['id'] as String,
                    ),
            child: HadeethDetailsView(title: title),
          );
        },
      ),
      GoRoute(
        path: '/surahTranslation/:id',
        name: 'surahTranslation',
        builder: (_, state) {
          final title = state.extra as String;
          final id = int.parse(state.pathParameters['id'] as String);
          return BlocProvider(
            create:
                (_) =>
                    getIt.get<TranslationCubit>()
                      ..getSurahTranslation(surahID: id),
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
