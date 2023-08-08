import 'dart:ffi';

import 'package:dio/dio.dart';

class WordsRepositoryAPI {
  final Dio dio;

  WordsRepositoryAPI({required this.dio});

  static const String host = "https://engsnapi.onrender.com";

  Future<dynamic> requestGetThemeWords(int themeId) async {
    try {
      var response = await dio.get("$host/themes/$themeId/words");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return Null;
      }
    } catch (e) {
      return Null;
    }
  }
}
