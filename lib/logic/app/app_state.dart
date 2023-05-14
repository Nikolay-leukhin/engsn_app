part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class UnAuthUserState extends AppState {}

class AuthUserState extends AppState{}