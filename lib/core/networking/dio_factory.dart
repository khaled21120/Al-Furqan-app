import 'package:dio/dio.dart';

import 'endpoints.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dioInstance;

  static Dio get dio => _dioInstance ??= _createDio();

  static Dio _createDio() {
    const timeOut = Duration(seconds: 30);
    final dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        followRedirects: true,
      ),
    );

    return dio;
  }
}
