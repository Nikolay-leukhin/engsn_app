part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}


class ProfileLoaded extends ProfileState{
  final String name;
  final String email;
  final String password;
  final String englishLevel;

  ProfileLoaded(this.name, this.email, this.password, this.englishLevel);
}

class ProfileLoading extends ProfileState{}

class ProfileLoadedFailure extends ProfileState{}