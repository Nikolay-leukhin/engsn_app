import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/message.dart';
import '../../../data/repository/user_repository.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final UserRepository userRepository;

  MessagesBloc(this.userRepository) : super(MessagesLoading()) {
    on<LoadMessagesEvent>(_loadMessages);
  }

  void _loadMessages(event, emit) async{
    emit(MessagesLoading());
    int userId = userRepository.userBox.get('user').id;
    int sessionId = (event as LoadMessagesEvent).sessionId;

    List<Message> messages = await userRepository.loadMessages(sessionId, userId);
    if (messages.isEmpty) {
      emit(MessagesLoadedEmpty());
    }else if (messages.isNotEmpty){
      emit(MessagesLoaded(messages));
    }else{
      emit(MessagesLoadedFailure());
    }
  }
}
