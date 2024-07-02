import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:dio/dio.dart';

class AppException {
  //HANDLE ERROR
  static String handleError<T>(
    DioException e, {
    T? data,
  }) {
    if (e.response != null && DioExceptionType.badResponse == e.type) {
      if (e.response?.data is Map<String, dynamic>) {
        debugLog(e.response?.data["error"]);
        return "${e.response?.data['error']}";
      } else if (e.response?.data is String) {
        debugLog(e.response?.data);
        return "${e.response?.data}";
      }
    }
    return _mapException(e.type);
  }

  static _mapException(DioExceptionType? error) {
    if (DioExceptionType.connectionTimeout == error ||
        DioExceptionType.receiveTimeout == error ||
        DioExceptionType.sendTimeout == error) {
      return Strings.timeout;
    } else if (DioExceptionType.unknown == error) {
      return Strings.connectionError;
    }
    return Strings.genericErrorMessage;
  }
}
