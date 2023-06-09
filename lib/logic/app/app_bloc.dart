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
  }

  final UserRepository userRepository;
}

