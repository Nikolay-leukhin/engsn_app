part of 'themes_bloc.dart';

abstract class ThemesState {}

class ThemesInitial extends ThemesState {}

class ThemesLoadingState extends ThemesState {}

class ThemesLoadedSuccess extends ThemesState {
  final List<ThemeModel> themes;

  ThemesLoadedSuccess({required this.themes});
}

class ThemesLoadedFailure extends ThemesState {}
