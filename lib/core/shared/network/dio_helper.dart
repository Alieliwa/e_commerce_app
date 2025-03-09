import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://student.valuxapps.com/api/",
      receiveDataWhenStatusError: true,
    ));
  }
  // get

  static Future<Response> getData({
    required String? url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await dio!.get(url!, queryParameters: query, data: data);
    } catch (e) {
      throw Exception('Error updating data: $e');
    }
  }

  //post
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await dio!.post(url, data: data);
    } catch (e) {
      throw Exception('Error updating data: $e');
    }
  }

  //put
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await dio!.put(url, data: data);
    } catch (e) {
      throw Exception('Error updating data: $e');
    }
  }

  //delete

  static Future<Response> deleteData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      return await dio!.delete(url, data: data);
    } catch (e) {
      throw Exception('Error updating data: $e');
    }
  }
}
