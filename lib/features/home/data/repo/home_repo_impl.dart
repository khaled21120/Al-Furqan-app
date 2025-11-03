import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import '../../../../core/utils/constants.dart';
import '../models/azkar_model.dart';

import '../../../../core/networking/error.dart';
import '../../../../core/networking/dio_service.dart';
import '../../../../core/services/location_service.dart';
import '../models/ayah_model.dart';
import '../models/hadeeths_categories_model.dart';
import '../models/hadeeth_details_model.dart';
import '../models/hadeeths_model.dart';
import '../models/prayer/prayer_model.dart';
import '../models/surah_model.dart';
import '../models/translation_model.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final DioService dioService;
  final LocationService locationService;

  HomeRepoImpl({required this.dioService, required this.locationService});
  @override
  Future<Either<Failures, List<SurahModel>>> getSurahs() async {
    try {
      final res = await dioService.getSurahs();
      return Right(res.data ?? []);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, AyahModel>> getAyahs({required int id}) async {
    try {
      final res = await dioService.getAyahs(id);
      return Right(res.data!);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, PrayerModel>> getPrayerTime({
    required String date,
  }) async {
    try {
      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
      final locationData = await locationService.setupLocation();

      if (locationData != null) {
        final res = await dioService.getPrayerTime(
          date: date,
          queries: {
            'latitude': locationData.latitude.toString(),
            'longitude': locationData.longitude.toString(),
            'method': '3',
            'timezone': currentTimeZone,
            'iso8601': 'true',
          },
        );
        return Right(res.data!);
      } else {
        return Left(ServerFailure('Can\'t get your location'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<HadeethsCategoriesModel>>>
  getHadeethCategories() async {
    try {
      final res = await dioService.getHadeethCategories();
      return Right(res);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.errMsg));
    }
  }

  @override
  Future<Either<Failures, List<HadeethsModel>>> getHadeethsByCategory({
    required int id,
  }) async {
    try {
      final res = await dioService.getHadeethsByCategory(id: id);
      return Right(res.data ?? []);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, HadeethDetailsModel>> getHadeethDetails({
    required int id,
  }) async {
    try {
      final res = await dioService.getHadeethDetails(id: id);
      return Right(res);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.errMsg));
    }
  }

  @override
  Future<Either<Failures, List<SurahTranslationModel>>> getSurahTranslations({
    required int id,
  }) async {
    try {
      final res = await dioService.getSurahTranslations(id);
      return Right(res.result ?? []);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.errMsg));
    }
  }

  @override
  Future<Either<Failures, List<AzkarModel>>> getAzkar({
    required String azkarType,
  }) async {
    try {
      String jsonString = await rootBundle.loadString(Constants.azkarJson);
      // Decode the JSON string
      var jsonData = json.decode(jsonString);
      final data = jsonData[azkarType] as List<dynamic>;
      return Right(data.map((e) => AzkarModel.fromJson(e)).toList());
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.errMsg));
    }
  }
}
