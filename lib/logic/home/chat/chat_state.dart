part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class LoadedChatListEmpty extends ChatState{}

class LoadedChatListFailure extends ChatState{}

class LoadingChatList extends ChatState{}

class LoadedChatList extends ChatState{
  final List<Session> sessions;

  LoadedChatList(this.sessions);
}

