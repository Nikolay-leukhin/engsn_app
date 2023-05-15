import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;

  ProfileBloc(this.userRepository) : super(ProfileInitial()) {
    on<ShowProfile>((event, emit) {
      print('show profile event is started');
      emit(ProfileLoading());
      try{
        String userName = userRepository.userBox.get("user").name;
        String email = userRepository.userBox.get('user').email;
        String password = userRepository.userBox.get('user').password;
        String englishLevel = userRepository.userBox.get('user').englishLevel;
        print(userName);
        emit(ProfileLoaded(userName, email, password, englishLevel));
      }catch(ex){
        emit(ProfileLoadedFailure());
      }
    });
  }
}
