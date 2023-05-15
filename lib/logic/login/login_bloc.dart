import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  LoginBloc(this.userRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async{

      print("login button pressed..");
      emit(LoginLoading());
      var result = await userRepository.login(event.email, event.password);
      print(result);
      if(result == RepositoryResponseCodes.succes){
        print("Login succes");
        emit(LoginLoaded());
      }
      else{
        print('Login failed');
        emit(LoginFailure());
      }
    });
  }
}
