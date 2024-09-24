import 'package:dio/dio.dart';

class DioExceptionModel implements Exception {
  late String errorMessage;

  DioExceptionModel.fromDioError(DioException dioError, String message) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timeout';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive timeout';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Send timeout';
        break;
      case DioExceptionType.badResponse:
        errorMessage =  message;
        break;
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          errorMessage = 'No internet connection';
          break;
        }
        errorMessage = 'Unexpected error occurred';
        break;
      default:
        errorMessage = 'Something went wrong';
        break;
    }
  }
}