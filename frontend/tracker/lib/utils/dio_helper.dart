import 'dart:convert';
import 'package:dio/dio.dart';

class DioHelper {
  final String apiBaseUrl;

  DioHelper({required this.apiBaseUrl});

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
      contentType: "application/json",
    );
    Dio dio = Dio(options);
    dio.interceptors.addAll(<Interceptor>[_loggingInterceptor()]);

    return dio;
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        response.data = json.decode(response.data);
        handler.next(response);
      },
      onError: (DioError e, handler) {
        if (e.response != null) {
        } else {
          handler.next(e);
        }
      },
    );
  }
}
