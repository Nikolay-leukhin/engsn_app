import 'package:dio/dio.dart';

class ThemeRepositoryAPI {
  late final Dio dio;

  ThemeRepositoryAPI({required dio}) {
    this.dio = dio;
  }

  Future<dynamic> getThemesRequest() async {
    try {
      var response = await dio.get('https://engsnapi.onrender.com/themes');
      List<dynamic> data = response.data['data'];
      return data;
    } catch (e) {
      throw e;
    }
  }
}
