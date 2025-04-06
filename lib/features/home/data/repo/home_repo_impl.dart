import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:quran/core/utils/constants.dart';
import 'package:quran/features/home/data/models/azkar_model.dart';

import '../../../../core/errors/error.dart';
import '../../../../core/services/back_storage_service.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/utils/helper.dart';
import '../models/ayah_model.dart';
import '../models/hadeeth_categories_model.dart';
import '../models/hadeeth_details_model.dart';
import '../models/hadeeths_model.dart';
import '../models/prayer_time_model.dart';
import '../models/surah_model.dart';
import '../models/translation_model.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final BackendStorageService backendStorageService;
  final LocationService locationService;

  HomeRepoImpl({
    required this.backendStorageService,
    required this.locationService,
  });
  @override
  Future<Either<Failures, List<SurahModel>>> getSurahs({
    required String endPoint,
  }) async {
    try {
      final res = await backendStorageService.getMapData(endPoint: endPoint);
      final surah = res['data'] as List;
      return Right(surah.map((e) => SurahModel.fromJson(e)).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.errMsg));
    }
  }

  @override
  Future<Either<Failures, List<AyahModel>>> getAyahs({
    required String endPoint,
    required int path,
  }) async {
    try {
      final res = await backendStorageService.getAyahs(
        endPoint: endPoint,
        path: path,
      );
      final data = res['data'] as Map<String, dynamic>;
      final ayahList = data['ayahs'] as List<dynamic>;

      final ayahs = ayahList.map((e) => AyahModel.fromJson(e)).toList();

      return Right(ayahs);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.errMsg));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failures, PrayerTimeModel>> getPrayerTime({
    required String date,
  }) async {
    try {
      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();

      final locationData = await locationService.setupLocation();

      if (locationData != null) {
        final res = await backendStorageService.getPrayerTime(
          long: locationData.longitude!,
          lat: locationData.latitude!,
          timeZone: currentTimeZone,
          date: date,
        );
        final data = res['data'] as Map<String, dynamic>;
        final prayerTime = data['timings'] as Map<String, dynamic>;
        return Right(PrayerTimeModel.fromJson(prayerTime));
      } else {
        return Left(ServerFailure('Can\'t get your location'));
      }
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.errMsg));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failures, List<HadeethCategorieshModel>>> getHadeethCategories({
    required String endPoint,
  }) async {
    try {
      final res = await backendStorageService.getListData(endPoint: endPoint);
      return Right(
        res.map((e) => HadeethCategorieshModel.fromJson(e)).toList(),
      );
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.errMsg));
    }
  }

  @override
  Future<Either<Failures, List<HadeethsModel>>> getHadeethsByCategory({
    required String path,
  }) async {
    try {
      final endPoint = Helper.getHadeethsEndPoint(path: path);
      final res = await backendStorageService.getMapData(endPoint: endPoint);
      final data = res['data'] as List;
      return Right(data.map((e) => HadeethsModel.fromJson(e)).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.errMsg));
    }
  }

  @override
  Future<Either<Failures, HadeethDetailsModel>> getHadeethDetails({
    required String path,
  }) async {
    try {
      final endPoint = Helper.getHadeethDetailsEndPoint(path: path);
      final res = await backendStorageService.getMapData(endPoint: endPoint);
      return Right(HadeethDetailsModel.fromJson(res));
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.errMsg));
    }
  }

  @override
  Future<Either<Failures, List<TranslationModel>>> getSurahTranslations({
    required int path,
  }) async {
    try {
      final endPoint = Helper.getSurahTrasnlationsEndPoint(path: path);
      final res = await backendStorageService.getMapData(endPoint: endPoint);
      final data = res['result'] as List<dynamic>;
      return Right(data.map((e) => TranslationModel.fromJson(e)).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.errMsg));
    }
  }

  @override
  Future<Either<Failures, List<AzkarModel>>> getAzkar({
    required String azkarType,
  }) async {
    try {
      String jsonString = await rootBundle.loadString(Constants.adkar);
      // Decode the JSON string
      var jsonData = json.decode(jsonString);
      final data = jsonData[azkarType] as List<dynamic>;
      return Right(data.map((e) => AzkarModel.fromJson(e)).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.errMsg));
    }
  }

  Future<Map<String, List<AzkarModel>>> fetchDuas() async {
    // Load the JSON data from the assets
    String jsonString = await rootBundle.loadString('assets/data.json');

    // Decode the JSON string
    var jsonData = json.decode(jsonString);

    // Extract the "أذكار الصباح" and "أذكار المساء" lists from the JSON data
    List<dynamic> morningDuasJson = jsonData['أذكار الصباح'];
    List<dynamic> eveningDuasJson = jsonData['أذكار المساء'];

    // Convert each JSON object to an instance of DuaModel
    List<AzkarModel> morningDuas =
        morningDuasJson.map((item) => AzkarModel.fromJson(item)).toList();
    List<AzkarModel> eveningDuas =
        eveningDuasJson.map((item) => AzkarModel.fromJson(item)).toList();

    // Return a map with both categories
    return {'أذكار الصباح': morningDuas, 'أذكار المساء': eveningDuas};
  }
}
