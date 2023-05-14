import 'package:engsn_corected/data/repository/user_repository.dart';
import 'package:engsn_corected/logic/home/chat/chat_bloc.dart';
import 'package:engsn_corected/view/screens/home/home_pages/chats/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';


import 'app.dart';
import 'data/models/user.dart';
import 'logic/app/app_bloc.dart';
import 'logic/home/messages/messages_bloc.dart';

void main() async {
  const String userBoxName = "user_box";
  await Hive.initFlutter();
  Hive.registerAdapter<User>(UserAdapter());
  var userBox = await Hive.openBox<User>(userBoxName);

  UserRepository _userRepository = UserRepository(userBox);

  runApp(
      RepositoryProvider(
        create: (context) => _userRepository,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AppBloc(userRepository: _userRepository),
            ),
            BlocProvider(
              create: (context) => ChatBloc(context.read<AppBloc>()),
            ),
            BlocProvider(
              create: (context) => MessagesBloc(_userRepository),
            ),
          ],
          child: App(),
        ),
      )
  );
}