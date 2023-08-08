import 'package:dio/dio.dart';
import 'package:engsn_corected/data/api/words_repository_api.dart';
import 'package:engsn_corected/data/models/words_model.dart';

class WordsRepository {
  late final Dio dioClient;
  late final WordsRepositoryAPI api;

  WordsRepository({required this.dioClient}) {
    api = WordsRepositoryAPI(dio: dioClient);
  }

  @override
  Future<dynamic> getThemeWords(int themeId) async {
    var words = await api.requestGetThemeWords(themeId);
    List<WordsModel> wordsList = [];
    if (words != Null && words['status'] == 200) {
      for (var item in words['data']) {
        WordsModel wordItem = WordsModel.fromJson(item);
        wordsList.add(wordItem);
      }
      return wordsList;
    } else {
      print('BUG WITH LOADING WORDS WARING!!!!!');
      return wordsList;
    }
  }
}
