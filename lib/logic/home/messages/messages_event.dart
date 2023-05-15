part of 'messages_bloc.dart';

@immutable
abstract class MessagesEvent {}


class LoadMessagesEvent extends MessagesEvent{
  final int sessionId;

  LoadMessagesEvent(this.sessionId);
}


class SendMessageEvent extends MessagesEvent{
  final int userId;
  final int sessionId;
  final int order;
  final String text;
  final String sender;


  SendMessageEvent(this.userId, this.sessionId, this.order, this.text, this.sender);
}
