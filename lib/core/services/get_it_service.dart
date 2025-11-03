import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/Cubits/azkar_cubit/azkar_cubit.dart';
import '../../features/home/Cubits/hadeeth_cubit/hadeeth_cubit.dart';
import '../../features/home/Cubits/last_read_cubit/last_read_cubit.dart';
import '../../features/home/Cubits/prayer_cubit/prayer_cubit.dart';
import '../../features/home/Cubits/surah_cuibit/surah_cubit.dart';
import '../../features/home/Cubits/translation_cubit/translation_cubit.dart';
import '../../features/home/Cubits/audio_cubit/audio_cubit.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../networking/dio_factory.dart';
import '../networking/dio_service.dart';
import 'location_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<Dio>(DioFactory.dio);
  getIt.registerSingleton<DioService>(DioService(getIt()));
  getIt.registerSingleton<LocationService>(LocationService());
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(dioService: getIt(), locationService: getIt()),
  );
  getIt.registerLazySingleton<AudioCubit>(() => AudioCubit());
  getIt.registerFactory<LastReadCubit>(() => LastReadCubit());
  getIt.registerFactory<SurahCubit>(() => SurahCubit(getIt()));
  getIt.registerFactory<PrayerCubit>(() => PrayerCubit(getIt()));
  getIt.registerFactory<AzkarCubit>(() => AzkarCubit(getIt()));
  getIt.registerFactory<TranslationCubit>(() => TranslationCubit(getIt()));
  getIt.registerFactory<HadeethCubit>(() => HadeethCubit(getIt()));
}
