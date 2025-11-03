import 'package:dartz/dartz.dart';
import '../../../../core/networking/error.dart';
import '../models/azkar_model.dart';
import '../models/hadeeths_categories_model.dart';
import '../models/hadeeth_details_model.dart';
import '../models/hadeeths_model.dart';
import '../models/translation_model.dart';

import '../models/ayah_model.dart';
import '../models/prayer/prayer_model.dart';
import '../models/surah_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<SurahModel>>> getSurahs();
  Future<Either<Failures, AyahModel>> getAyahs({required int id});
  Future<Either<Failures, PrayerModel>> getPrayerTime({required String date});

  Future<Either<Failures, List<HadeethsCategoriesModel>>>
  getHadeethCategories();

  Future<Either<Failures, List<HadeethsModel>>> getHadeethsByCategory({
    required int id,
  });

  Future<Either<Failures, HadeethDetailsModel>> getHadeethDetails({
    required int id,
  });

  Future<Either<Failures, List<SurahTranslationModel>>> getSurahTranslations({
    required int id,
  });
  Future<Either<Failures, List<AzkarModel>>> getAzkar({
    required String azkarType,
  });
}
