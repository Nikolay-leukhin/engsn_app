import 'package:dio/dio.dart';
import 'package:engsn_corected/data/repository/theme_repository.dart';
import 'package:engsn_corected/data/repository/user_repository.dart';
import 'package:engsn_corected/data/repository/words_repository.dart';
import 'package:engsn_corected/logic/home/chat/chat_bloc.dart';
import 'package:engsn_corected/logic/home/dictionary/themes/themes_bloc.dart';
import 'package:engsn_corected/logic/home/dictionary/words/words_bloc.dart';
import 'package:engsn_corected/view/screens/home/home_pages/chats/chat_list.dart';
import 'package:engsn_corected/view/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'app.dart';
import 'data/models/user.dart';
import 'logic/app/app_bloc.dart';
import 'logic/home/messages/messages_bloc.dart';
import 'logic/home/profile/profile_bloc.dart';
import 'logic/login/login_bloc.dart';
import 'logic/signin/signin_bloc.dart';

void main() async {
  const String userBoxName = "user_box";
  await Hive.initFlutter();
  Hive.registerAdapter<User>(UserAdapter());
  var userBox = await Hive.openBox<User>(userBoxName);
  Dio dio = Dio();

  UserRepository _userRepository = UserRepository(userBox: userBox, dioClient: dio);
  WordsRepository _wordsRepository = WordsRepository(dioClient: dio);
  ThemeReposiotry _themeRepository = ThemeReposiotry(dio: dio, wordsRepository: _wordsRepository);

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => _userRepository,
      ),
      RepositoryProvider(
        create: (context) => _wordsRepository,
      ),
      RepositoryProvider(create: (context) => _themeRepository)
    ],
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
        BlocProvider(
          create: (context) => ProfileBloc(_userRepository),
        ),
        BlocProvider<LoginBloc>(create: (context) => LoginBloc(_userRepository)),
        BlocProvider<SigninBloc>(create: (context) => SigninBloc(_userRepository)),
        BlocProvider<ThemesBloc>(create: (context) => ThemesBloc(themeRepository: _themeRepository)),
        BlocProvider<WordsBloc>(create: (context) => WordsBloc(wordsRepository: _wordsRepository),)
      ],
      child: App(),
    ),
  ));
}
