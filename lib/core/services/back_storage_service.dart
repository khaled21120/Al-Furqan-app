import 'package:dio/dio.dart';

import '../errors/error.dart';
import '../utils/helper.dart';

class BackendStorageService {
  final Dio dio;

  BackendStorageService({required this.dio});
  Future<Map<String, dynamic>> getMapData({required String endPoint}) async {
    try {
      final res = await dio.get(endPoint);
      if (res.statusCode == 200) {
        return res.data as Map<String, dynamic>;
      } else {
        throw Exception('Unexpected status code: ${res.statusCode}');
      }
    } on DioException catch (dioError) {
      throw ServerFailure.fromDioException(dioError);
    }
  }

  Future<Map<String, dynamic>> getAyahs({
    required String endPoint,
    required int path,
  }) async {
    try {
      final res = await dio.get('$endPoint$path');
      if (res.statusCode == 200) {
        return res.data as Map<String, dynamic>;
      } else {
        throw Exception('Unexpected status code: ${res.statusCode}');
      }
    } on DioException catch (dioError) {
      throw ServerFailure.fromDioException(dioError);
    }
  }

  Future<Map<String, dynamic>> getPrayerTime({
    required double long,
    required String timeZone,
    required double lat,
    required String date,
  }) async {
    final endPoint = Helper.getPrayerTimeEndPoint(
      lat: lat,
      date: date,
      long: long,
      timeZone: timeZone,
    );
    try {
      final res = await dio.get(endPoint);
      if (res.statusCode == 200) {
        return res.data as Map<String, dynamic>;
      } else {
        throw Exception('Unexpected status code: ${res.statusCode}');
      }
    } on DioException catch (dioError) {
      throw ServerFailure.fromDioException(dioError);
    }
  }

  Future<List<dynamic>> getListData({required String endPoint}) async {
    try {
      final res = await dio.get(endPoint);
      if (res.statusCode == 200) {
        return res.data as List<dynamic>;
      } else {
        throw Exception('Unexpected status code: ${res.statusCode}');
      }
    } on DioException catch (dioError) {
      throw ServerFailure.fromDioException(dioError);
    }
  }
}
