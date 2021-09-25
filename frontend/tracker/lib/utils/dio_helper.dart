import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioHelper {
  final String apiBaseUrl;

  DioHelper({required this.apiBaseUrl});

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
      contentType: 'application/json',
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer ${dotenv.env["NOTION_API_KEY"]}',
        'Notion-Version': '2021-05-13'
      },
    );
    Dio dio = Dio(options);
    dio.interceptors.addAll(<Interceptor>[_loggingInterceptor()]);

    return dio;
  }

  Interceptor _loggingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        print('''REQUEST
        PATH =  ${options.path}
        DATA = ${options.data}
        QUERYPARAMS =  ${options.queryParameters}
        HEADER =  ${options.headers}
        ''');
        return handler.next(options); //continue
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        print('''RESPONSE
        CODE =  ${response.statusCode}
        MESSAGE =  ${response.statusMessage}
        RESPONSE DATA = ${response.data}
        ''');
        handler.next(response);
      },
      onError: (DioError e, handler) {
        if (e.response != null) {
          print('''
          PATH =  ${e.response?.realUri.path}
          CODE ${e.response?.statusCode}
          MESSAGE ${e.response?.statusMessage}
          ''');
        }
        handler.next(e);
      },
    );
  }
}
