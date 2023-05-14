part of 'messages_bloc.dart';

@immutable
abstract class MessagesState {}

class MessagesInitial extends MessagesState {}


class MessagesLoading extends MessagesInitial{}

class MessagesLoaded extends MessagesInitial{
  final List<Message> messages;

  MessagesLoaded(this.messages);
}

class MessagesLoadedEmpty extends MessagesState{}

class MessagesLoadedFailure extends MessagesState{}