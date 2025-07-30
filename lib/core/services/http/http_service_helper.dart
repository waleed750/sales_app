import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core_export.dart';

class HttpServiceHelper {
  static Duration requestDuration = const Duration(seconds: 50);

  // static final _httpController = serviceLocator<HttpService>();
  // static final _tokenController = serviceLocator<TokenUtils>();

  static BaseOptions options() {
    return BaseOptions(
      receiveTimeout: requestDuration,
      //? it solve [🔔 Dio] sendTimeout cannot be used without a request body to send on Web
      sendTimeout: kIsWeb ? Duration.zero : requestDuration,
      connectTimeout: requestDuration,
      receiveDataWhenStatusError: true,
      baseUrl: APIs.baseURL,
      followRedirects: false,
      validateStatus: (status) {
        return status! <= 500;
      },
      headers: {'Accept': "application/json"},
    );
  }

  static InterceptorsWrapper buildInterceptor() {
    return InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    );
  }

  static void _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {} finally {
      handler.next(options); // must call it to continue request
    }
  }

  static void _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    log('error.response?.statusCode ${error.response?.statusCode}');
    log('error.message ${error.message}');
    log('error.response?.headers ${error.response?.headers}');
    log('error.response?.data ${error.response?.data}');

    if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 403) {
      handler.next(error);
    } else {
      handler.next(error);
    }
  }

  static void _onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    // log('response.statusCode ${response.statusCode}');
    if (response.statusCode == 400) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
        ),
      );
    } else if (response.statusCode == null) {
    }
    //  else if (response.statusCode == 401 || response.statusCode == 403) {
    //   //! I commented this because when I use it, it make many requests to the server
    //   // handler.resolve(await _httpController.retry(response.requestOptions));
    // }
    else {
      // if (response.statusCode != 204) {
      //   if (response.data is! String) {
      //     var result = BaseResponse.fromJson(response.data);
      //     if (result.status == 1 && result.Message == null) {
      //       throw Exception("Service Exception: ${result.Message}");
      //     }
      //   }
      // }

      handler.resolve(response);
    }
  }

  static PrettyDioLogger buildPrettyDioLoggerInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: false,
      error: true,
      maxWidth: 40,
    );
  }
}
