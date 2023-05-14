part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class AppInitialEvent extends AppEvent{}

class LoginButtonPressed implements AppEvent{}

class LogoutButtonPressed implements AppEvent{}

