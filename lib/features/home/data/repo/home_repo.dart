import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/error.dart';
import 'package:quran/features/home/data/models/azkar_model.dart';
import 'package:quran/features/home/data/models/hadeeth_categories_model.dart';
import 'package:quran/features/home/data/models/hadeeth_details_model.dart';
import 'package:quran/features/home/data/models/hadeeths_model.dart';
import 'package:quran/features/home/data/models/prayer_time_model.dart';
import 'package:quran/features/home/data/models/translation_model.dart';

import '../models/ayah_model.dart';
import '../models/surah_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<SurahModel>>> getSurahs({
    required String endPoint,
  });
  Future<Either<Failures, List<AyahModel>>> getAyahs({
    required String endPoint,
    required int path,
  });
  Future<Either<Failures, PrayerTimeModel>> getPrayerTime({
    required String date,
  });

  Future<Either<Failures, List<HadeethCategorieshModel>>> getHadeethCategories({
    required String endPoint,
  });

  Future<Either<Failures, List<HadeethsModel>>> getHadeethsByCategory({
    required String path,
  });

  Future<Either<Failures, HadeethDetailsModel>> getHadeethDetails({
    required String path,
  });

  Future<Either<Failures, List<TranslationModel>>> getSurahTranslations({
    required int path,
  });
  Future<Either<Failures, List<AzkarModel>>> getAzkar({
    required String azkarType,
  });
}
