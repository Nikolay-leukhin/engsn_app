import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engsn_corected/data/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';
part 'app_event.dart';


class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.userRepository}) : super(AppInitial()) {
    on<AppInitialEvent>(
        (event, emit) async{
          List<dynamic> cachedKeys = await userRepository.userBox.keys.toList();
          if (cachedKeys.length > 0){
            print('user exists ${userRepository.userBox.get('user').id}');
            emit(AuthUserState());
          }
          else{
            print("no cahed user exist => you waw redirected to login screen");
            emit(UnAuthUserState());
          }
        }
    );
    on<LoginButtonPressed>((event, emit) async {
      print("login button pressed..");
      emit(AppLoading());
      var result = await userRepository.login();
      print(result);
      if(result == RepositoryResponseCodes.succes){
        print("Login succes");
        emit(AuthUserState());
      }
      else{
        print('Login failed');
        emit(UnAuthUserState());
      }

    });
  }

  final UserRepository userRepository;
}

