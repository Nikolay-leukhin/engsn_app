import 'package:engsn_corected/view/screens/home/home_screen.dart';
import 'package:engsn_corected/view/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class AppRouter{
  Route onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
        break;
      case '/err':
        return MaterialPageRoute(builder: (_) => Text("Unknown page"));
      default: return MaterialPageRoute(builder: (_) => Text('erroor'));
    }
  }
}