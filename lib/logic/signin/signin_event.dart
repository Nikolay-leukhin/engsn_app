part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SigninMainButtonPressed extends SigninEvent{
  final String nickname;
  final String email;
  final String password;
  final String repeatedPassword;

  SigninMainButtonPressed({required this.nickname, required this.email, required this.password, required this.repeatedPassword});
}

class SigninLevelButtonPressed extends SigninEvent{
  final String? selectedLevel;

  SigninLevelButtonPressed(this.selectedLevel);
}