import 'package:dio/dio.dart';
import 'package:engsn_corected/data/api/theme_repository_api.dart';
import 'package:engsn_corected/data/models/theme_model.dart';
import 'package:engsn_corected/data/repository/words_repository.dart';

class ThemeReposiotry {
  final Dio dio;

  late final ThemeRepositoryAPI api;
  late final WordsRepository wordsRepository;

  ThemeReposiotry({required this.dio, required this.wordsRepository}) {
    api = ThemeRepositoryAPI(dio: this.dio);
  }

  Future<List<ThemeModel>> getThemes() async {
    var rawThemes = await api.getThemesRequest();
    List<ThemeModel> themes = [];
    if (rawThemes != Null) {
      for (int i = 0; i < (rawThemes).length; i++) {
        int themeId = rawThemes[i]['id'];
        String themeName = rawThemes[i]['theme_name'];
        var words = await wordsRepository.getThemeWords(themeId);

        ThemeModel themeItem = ThemeModel(id: themeId, themeName: themeName, wordsTheme: words);

        themes.add(themeItem);
      }
    }

    return themes;
  }
}
