part of 'messages_bloc.dart';

@immutable
abstract class MessagesEvent {}


class LoadMessagesEvent extends MessagesEvent{
  final int sessionId;

  LoadMessagesEvent(this.sessionId);
}