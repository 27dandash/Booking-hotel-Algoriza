import 'package:dio/dio.dart';

import '../../main.dart';
import 'app_strings.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.mahmoudtaha.com/',
        receiveDataWhenStatusError: true,
      ),
    );

  }

  static Future<Response> getData(
      {required String url,
        Map<String, dynamic>? query,
        String lang = 'en',
        String? token,
        Map<String, dynamic>? headers}) async {
    dio.options.headers = headers;
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required dynamic data,
    String lang = 'en',
    String? token,
    bool isMultipart = false,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'token': token
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String? url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'token': token,
    };
    return await dio.put(url!, queryParameters: query, data: data);
  }
}
