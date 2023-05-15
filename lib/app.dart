
import 'package:engsn_corected/view/router/app_router.dart';
import 'package:engsn_corected/view/screens/home/home_screen.dart';
import 'package:engsn_corected/view/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/app/app_bloc.dart';
import 'logic/home/home_bloc.dart';
import 'logic/login/login_bloc.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppRouter _routes = AppRouter();

  void initState(){
    BlocProvider.of<AppBloc>(context).add(AppInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'project title',
      theme: ThemeData.dark(),
      home: Scaffold(
        body: BlocConsumer<AppBloc, AppState>(
          listener: (context, state) {},
          builder: (otherContext, state) {
            if (state is AuthUserState){
              return HomePage();
              // return LoginPage();
            }else if (state is UnAuthUserState){
              return LoginPage();
            }else{
              return Center(child: CircularProgressIndicator());
            }
          },
        )
      ),
      onGenerateRoute: _routes.onGenerateRoute,
    );
  }
}
