part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

class SigninDifferentPassword extends SigninState{}

class SigninShortPassword extends SigninState{}

class SigninIncorrectEmail extends SigninState{}

class SigninNameShort extends SigninState{}

class SigninUserProfileDataSuccess extends SigninState{}

class SigninLevelUnselected extends SigninState{}

class SigninLevelSelected extends SigninState{}

class SigninLevelSelectedLoading extends SigninState{}