import 'package:dio/dio.dart';
import '../../features/home/data/models/hadeeth_details_model.dart';
import '../../features/home/data/models/hadeeths_model.dart';
import '../../features/home/data/models/surah_model.dart';
import '../../features/home/data/models/translation_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/home/data/models/ayah_model.dart';
import '../../features/home/data/models/hadeeths_categories_model.dart';
import '../../features/home/data/models/prayer/prayer_model.dart';
import 'endpoints.dart';
import 'genaric.dart';

part 'dio_service.g.dart';

@RestApi(baseUrl: Endpoints.baseUrl)
abstract class DioService {
  factory DioService(Dio dio, {String? baseUrl}) = _DioService;

  @GET('${Endpoints.surah}/{id}')
  Future<BaseResponse<AyahModel>> getAyahs(@Path('id') int id);

  @GET(Endpoints.surah)
  Future<BaseResponse<List<SurahModel>>> getSurahs();

  @GET('${Endpoints.prayerTime}/{date}')
  Future<BaseResponse<PrayerModel>> getPrayerTime({
    @Path('date') required String date,
    @Queries() required Map<String, dynamic> queries,
  });

  @GET(Endpoints.hadeethsCategories)
  Future<List<HadeethsCategoriesModel>> getHadeethCategories({
    @Query('language') String language = 'ar',
  });

  @GET(Endpoints.hadeethByCategory)
  Future<BaseResponse<List<HadeethsModel>>> getHadeethsByCategory({
    @Query('language') String language = 'ar',
    @Query('category_id') required int id,
  });
  @GET(Endpoints.hadeethDetails)
  Future<HadeethDetailsModel> getHadeethDetails({
    @Query('language') String language = 'ar',
    @Query('id') required int id,
  });

  @GET('${Endpoints.surahTranslations}/{id}')
  Future<BaseResponse<List<SurahTranslationModel>>> getSurahTranslations(
    @Path('id') int id,
  );
}
