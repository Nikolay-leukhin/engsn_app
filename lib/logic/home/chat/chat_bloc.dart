import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engsn_corected/data/repository/user_repository.dart';
import 'package:meta/meta.dart';

import '../../../data/models/session.dart';
import '../../app/app_bloc.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final AppBloc appBloc;

  ChatBloc(this.appBloc) : super(ChatInitial()) {
    on<LoadSessionsEvent>(_loadSession);
    on<RegisterSessionEvent>(_registerSession);
  }

  void _loadSession(event, emit) async {
    print("load sessions event started");
    emit(LoadingChatList());
    List<Session> sessions = await appBloc.userRepository.loadUserSessions();
    if (sessions.isEmpty){
      emit(LoadedChatListEmpty());
    }else if (sessions.isNotEmpty){
      emit(LoadedChatList(sessions));
    }else{
      emit(LoadedChatListFailure());
    }
  }

  void _registerSession(event, emit) async{
    print("register session is started");

    var responseOfAddingSession = await appBloc.userRepository.addUserSession((event as RegisterSessionEvent).sessionName);
    print(responseOfAddingSession);
  }

}
