import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/models/message.dart';
import '../../../data/repository/user_repository.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final UserRepository userRepository;

  MessagesBloc(this.userRepository) : super(MessagesLoading()) {
    on<LoadMessagesEvent>(_loadMessages);
    on<SendMessageEvent>(_sendMessage);
  }

  void _loadMessages(event, emit) async {
    print(state);
    int userId = userRepository.userBox.get('user').id;
    int sessionId = (event as LoadMessagesEvent).sessionId;

    try {
      List<Message> messages = await userRepository.loadMessages(sessionId, userId);
      emit(MessagesLoaded(messages));
    } catch (ex) {
      emit(MessagesLoadedFailure());
    }
  }

  void _sendMessage(event, emit) async {
    List<Message> currentMessagesList = (state as MessagesLoaded).messages;
    currentMessagesList.add((event as SendMessageEvent).message);

    var botPreMsg = (Message(
      userId: event.message.userId,
      sender: "loading",
      messageOrder: event.message.messageOrder + 1,
      messageText: "Loading...",
      sessionId: event.message.sessionId,
    ));

    currentMessagesList.add(botPreMsg);
    emit(MessagesLoaded(currentMessagesList));

    Message botMessage = await userRepository.sendMessage(
        event.message.userId, event.message.sessionId, event.message.messageOrder, event.message.messageText, event.message.sender);
    (state as MessagesLoaded).messages.removeLast();
    (state as MessagesLoaded).messages.add(botMessage);
    emit(MessagesLoaded(currentMessagesList));
  }
}
