part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}


class LoginUserAlreadyExist extends LoginState{}

class LoginLoading extends LoginState{}

class LoginIncorrectData extends LoginState{}


class LoginFailure extends LoginState{}

class LoginLoaded extends LoginState{}
