import 'dart:async';
import 'dart:convert';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_strings.dart';

class HeaderInterceptor extends Interceptor {
  final Dio dio;
  final Ref ref;
  HeaderInterceptor({
    required this.dio,
    required this.ref,
  });

  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    handler.next(options);
    try {
      const token = '';
      if (token.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $token";
        debugLog('[TOKEN]$token');
      }
    } catch (e) {
      debugLog(e);
    }
    if (options.data != null) {
      if (options.data is FormData) {
        debugLog("[BODY] ${options.data.fields}");
        debugLog("[BODY] ${options.data.files}");
      }
      debugLog('[URL]${options.uri}');
      debugLog("[BODY] ${options.data}");
      debugLog("[METHOD] ${options.method}");
      debugLog('[QUERIES]${options.queryParameters}');
    }
    return options;
  }

  @override
  FutureOr<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    debugLog("[ERROR] ${err.requestOptions.uri}");
    debugLog("[ERROR] ${err.response}");
    debugLog("[ERROR] ${err.response?.statusCode}");
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      _refreshToken(err, handler, dio);
      // appRouter.replaceAll([const GetstartedRoute()]);
      return;
    }
    handler.next(err);
    return err;
  }

  @override
  FutureOr<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugLog(
      "[RESPONSE FROM ${response.requestOptions.path}]: ${jsonEncode(response.data)}",
    );
    handler.next(response);
    return response;
  }
}

Future<void> _refreshToken(DioException error, ErrorInterceptorHandler handler, Dio dio) async {
  const refreshToken = '';
  debugLog('[REFRESH TOKEN]$refreshToken');
  try {
    final r = await Dio().post(
      '${AuthStrings.baseUrl}/refreshToken',
      data: {
        'refreshToken': refreshToken,
      },
    );
    debugLog('[REFRESH RESPONSE] ${r.data}');
    if (r.statusCode == 200 || r.statusCode == 201) {
      // RefreshToken tokenData = RefreshToken.fromJson(r.data);
      //save token data
    }
    return handleError(handler, error, dio);
  } on DioException catch (e) {
    debugLog('[REFRESH ERROR] ${e.response}');
    //redirect to login
    return;
  }
}

Future<void> handleError(ErrorInterceptorHandler handler, DioException err, Dio dio) async {
  final opts = Options(
    method: err.requestOptions.method,
    headers: err.requestOptions.headers,
  );
  final cloneReq = await dio.request(
    err.requestOptions.path,
    options: opts,
    data: err.requestOptions.data,
    queryParameters: err.requestOptions.queryParameters,
  );

  return handler.resolve(cloneReq);
}

//<=================Places Headers================>

class PlacesInterceptor extends Interceptor {
  final Dio dio;
  PlacesInterceptor({
    required this.dio,
  });

  @override
  FutureOr<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    handler.next(options);
    if (options.data != null) {
      debugLog('[URL]${options.uri}');
      debugLog("[BODY] ${jsonEncode(options.data)}");
      debugLog("[METHOD] ${options.method}");
    }
    return options;
  }

  @override
  FutureOr<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    handler.next(err);
    return err;
  }

  @override
  FutureOr<dynamic> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugLog("Response: ${jsonEncode(response.data)}");
    handler.next(response);
    return response;
  }
}
