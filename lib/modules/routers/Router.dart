import 'package:flutter/material.dart';
import 'package:my_app/modules/auth/SignUp.dart';
import 'package:my_app/modules/auth/Login.dart';
import 'package:my_app/modules/home/HomeApp.dart';


class Router{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RouterPath.Home:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case RouterPath.Login:
        return MaterialPageRoute(builder: (_) => Login());
        break;
      case RouterPath.SignUp:
        return MaterialPageRoute(builder: (_) => SignUp());
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));

    }
  }
}

class RouterPath{
  static const String Home = "/home";
  static const String Login = "/login";
  static const String SignUp = "/signup";
}