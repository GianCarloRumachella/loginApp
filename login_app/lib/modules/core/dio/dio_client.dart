import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio();
  }

  Future<Response> fetchData(String url) async {
    try {
      Response response = await _dio.get(url);
      return response;
    } catch (error) {
      throw Exception('Failed to fetch data: $error');
    }
  }
}
