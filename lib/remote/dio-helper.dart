import 'package:dio/dio.dart';

class dioHelper {
  static Dio? dio;
  static initl() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
  }) async {
    return await dio!.get(url,queryParameters: query);
  }
}
