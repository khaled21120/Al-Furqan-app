import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quran/features/home/Cubits/Translation%20Cubit/translation_cubit.dart';
import 'package:quran/features/home/Cubits/Azkar%20Cubit/azkar_cubit.dart';

import '../../features/home/Cubits/Hadeeth%20Cubit/hadeeth_cubit.dart';
import '../../features/home/Cubits/Last%20Read%20Cubit/last_read_cubit.dart';
import '../../features/home/Cubits/Prayer%20Cubit/prayer_cubit.dart';
import '../../features/home/Cubits/Surah Cuibit/surah_cubit.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../utils/endpoints.dart';
import 'back_storage_service.dart';
import 'location_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    ),
  );
  getIt.registerSingleton<BackendStorageService>(
    BackendStorageService(dio: getIt.get<Dio>()),
  );
  getIt.registerSingleton<LocationService>(LocationService());
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      backendStorageService: getIt.get<BackendStorageService>(),
      locationService: getIt.get<LocationService>(),
    ),
  );
  getIt.registerFactory<LastReadCubit>(() => LastReadCubit());
  getIt.registerFactory<SurahCubit>(() => SurahCubit(getIt.get<HomeRepo>()));
  getIt.registerFactory<PrayerCubit>(() => PrayerCubit(getIt.get<HomeRepo>()));
  getIt.registerFactory<AzkarCubit>(() => AzkarCubit(getIt.get<HomeRepo>()));
  getIt.registerFactory<TranslationCubit>(
    () => TranslationCubit(getIt.get<HomeRepo>()),
  );
  getIt.registerFactory<HadeethCubit>(
    () => HadeethCubit(getIt.get<HomeRepo>()),
  );
}
