part of 'words_bloc.dart';

abstract class WordsEvent {}

class WordsLoadingEvent extends WordsEvent {
  final ThemeModel theme;

  WordsLoadingEvent({required this.theme});
}
