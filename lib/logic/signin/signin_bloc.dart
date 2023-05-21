import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:engsn_corected/data/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final UserRepository userRepository;
  SigninBloc(this.userRepository) : super(SigninInitial()) {
    on<SigninMainButtonPressed>((event, emit) {
      if (event.password != event.repeatedPassword){
        emit(SigninDifferentPassword());
      }else if (!event.email.contains("@")){
        emit(SigninIncorrectEmail());
      }else if(event.nickname.length < 6){
        emit(SigninNameShort());
      }else if(event.password.length < 6){
        emit(SigninShortPassword());
      }else{
        userRepository.email = event.email;
        userRepository.password = event.password;
        userRepository.nickname = event.nickname;
        emit(SigninUserProfileDataSuccess());
      }
    });
    on<SigninLevelButtonPressed>((event, emit) async {
      if (event.selectedLevel == null){
        emit(SigninLevelUnselected());
      }else{
        userRepository.englishLevel = event.selectedLevel;
        emit(SigninLevelSelectedLoading());
        RepositoryResponseCodes response = await userRepository.addUser(userRepository.nickname!, userRepository.email!, userRepository.password!, userRepository.englishLevel!);
        if (response == RepositoryResponseCodes.succes){
          emit(SigninLevelSelected());
        }
      }
    });
  }


}
