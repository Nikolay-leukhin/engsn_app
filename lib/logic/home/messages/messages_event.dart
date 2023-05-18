part of 'messages_bloc.dart';

@immutable
abstract class MessagesEvent {}


class LoadMessagesEvent extends MessagesEvent{
  final int sessionId;
  LoadMessagesEvent(this.sessionId);
}


class SendMessageEvent extends MessagesEvent{
  final Message message;
  SendMessageEvent(this.message);
}
