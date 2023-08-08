import 'package:bloc/bloc.dart';
import 'package:engsn_corected/data/models/theme_model.dart';
import 'package:engsn_corected/data/models/words_model.dart';
import 'package:engsn_corected/data/repository/words_repository.dart';
import 'package:equatable/equatable.dart';

part 'words_event.dart';
part 'words_state.dart';

class WordsBloc extends Bloc<WordsEvent, WordsState> {
  final WordsRepository wordsRepository;

  WordsBloc({required this.wordsRepository}) : super(WordsInitial()) {
    on<WordsLoadingEvent>(_loadWords);
  }

  void _loadWords(event, emit) async {
    print("WORDS STARTED LOADING");
    emit(WordsLoading());
    if ((event as WordsLoadingEvent).theme.wordsTheme.isNotEmpty) {
      print("SUCCES WORDS REQUEST");
      emit(WordsLoadedSuccess(words: event.theme.wordsTheme));
    } else {
      print("WARNIGN BAD WORDS REQUEST");
      emit(WordsLoadedFailure());
    }
  }
}
