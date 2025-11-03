import 'package:dio/dio.dart';

abstract class Failures {
  Failures(this.errMsg);
  final String errMsg;
}

class ServerFailure extends Failures {
  ServerFailure(super.errMsg);

  factory ServerFailure.fromDioException(DioException err) {
    if (err.response != null) {
      return ServerFailure.fromResponse(
        err.response!.statusCode ?? 500,
        err.response!.data,
      );
    }

    switch (err.type) {
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure('Bad Response from Server');
      case DioExceptionType.cancel:
        return ServerFailure('Request Canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.unknown:
        return ServerFailure('Unknown Error: ${err.message}');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, String message) {
    switch (statusCode) {
      case 400:
        return ServerFailure('Invalid request. Please check your input.');
      case 401:
        return ServerFailure('Your session has expired. Please log in again.');
      case 403:
        return ServerFailure('You don’t have permission to do this.');
      case 404:
        return ServerFailure('We couldn’t find what you’re looking for.');
      case 405:
        return ServerFailure('Action not allowed. Please try again.');
      case 409:
        return ServerFailure('There’s a conflict. Please try again.');
      case 500:
        return ServerFailure('Server error. Please try again later.');
      case 503:
        return ServerFailure('Server is busy. Please try again later.');
      default:
        return ServerFailure('Error $statusCode: Something went wrong.');
    }
  }
}
