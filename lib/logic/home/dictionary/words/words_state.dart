part of 'words_bloc.dart';

abstract class WordsState {}

class WordsInitial extends WordsState {}

class WordsLoadedSuccess extends WordsState {
  final List<WordsModel> words;

  WordsLoadedSuccess({required this.words});
}

class WordsLoadedFailure extends WordsState {}

class WordsLoading extends WordsState {}
