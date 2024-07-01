import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:dio/dio.dart';

import '../response/base_response.dart';

class AppException {
  //HANDLE ERROR
  static BaseResponse<T> handleError<T>(
    DioException e, {
    T? data,
  }) {
    if (e.response != null && DioExceptionType.badResponse == e.type) {
      if (e.response?.data is Map<String, dynamic>) {
        debugLog(BaseResponse.fromMap(e.response?.data).status.errorMessage);
        return BaseResponse.fromMap(e.response?.data);
      } else if (e.response?.data is String) {
        debugLog(e.response?.data);
        return BaseResponse(
          status: Status(
            errorCode: e.response?.statusCode,
            errorMessage: e.response?.data,
          ),
          data: data,
        );
      }
    }
    return BaseResponse(
      status: Status(
        errorCode: e.response?.statusCode,
        errorMessage: _mapException(e.type),
      ),
      data: data,
    );
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
