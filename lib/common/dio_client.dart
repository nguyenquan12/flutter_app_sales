import 'package:app_sales/data/datasources/local/share_pref.dart';
import 'package:dio/dio.dart';

class DioClient {
  Dio? _dio;
  static final BaseOptions _options = BaseOptions(
    baseUrl: "https://freeapi.code4func.com/api/v1/",
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 3000),
  );

  static final DioClient instance = DioClient._internal();

  DioClient._internal() {
    if (_dio == null) {
      _dio = Dio(_options);
      // _dio!.interceptors.add(LogInterceptor(requestBody: true));
      _dio!.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async {
          var token = await SharePref.instance.get("token");
          if (token != null) {
            // ignore: prefer_interpolation_to_compose_strings
            options.headers["Authorization"] = "Bearer " + token;
          }
          return handler.next(options);
        },
        onResponse: (e, handler) {
          return handler.next(e);
        },
        onError: (e, handler) {
          return handler.next(e);
        },
      ));
    }
  }

  Dio get dio => _dio!;
}
