import 'package:engsn_corected/view/screens/home/home_screen.dart';
import 'package:engsn_corected/view/screens/login/login_screen.dart';
import 'package:engsn_corected/view/screens/signin/signin_level_screen.dart';
import 'package:flutter/material.dart';

import '../screens/signin/signin_screen.dart';

class AppRouter{
  Route onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/err':
        return MaterialPageRoute(builder: (_) => Text("Unknown page"));
      case '/signin':
        return MaterialPageRoute(builder: (_) => SigninPage());
      case '/signin/level':
        return MaterialPageRoute(builder: (_) => SigninLevelScreen());
      default: return MaterialPageRoute(builder: (_) => Text('erroor'));
    }
  }
}