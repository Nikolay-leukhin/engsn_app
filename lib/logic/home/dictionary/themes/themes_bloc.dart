import 'package:bloc/bloc.dart';
import 'package:engsn_corected/data/models/theme_model.dart';
import 'package:engsn_corected/data/repository/theme_repository.dart';
import 'package:equatable/equatable.dart';

part 'themes_event.dart';
part 'themes_state.dart';

class ThemesBloc extends Bloc<ThemesEvent, ThemesState> {
  final ThemeReposiotry themeRepository;

  ThemesBloc({required this.themeRepository}) : super(ThemesInitial()) {
    on<LoadingThemesEvent>(_loadThemes);
  }

  Future<void> _loadThemes(event, emit) async {
    print('themes started loading');
    emit(ThemesLoadingState());

    var themes = await themeRepository.getThemes();
    print(themes);
    if (themes != Null) {
      emit(ThemesLoadedSuccess(themes: themes));
    } else {
      emit(ThemesLoadedFailure());
    }

    print('themes loaded');
  }
}
