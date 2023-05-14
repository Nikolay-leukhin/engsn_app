part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class LoadSessionsEvent extends ChatEvent{}

class RegisterSessionEvent extends ChatEvent{
  final String sessionName;

  RegisterSessionEvent({required this.sessionName});
}