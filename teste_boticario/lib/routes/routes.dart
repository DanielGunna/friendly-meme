import 'package:flutter/material.dart';
import 'package:teste_boticario/screens/login/login.dart';
import 'package:teste_boticario/screens/signup.dart';

class Routes {
  static const LOGIN = "/login";
  static const SIGNUP = "/signup";
  static const CREATE_POST = "/new_post";
  static const FEED = "/feed";
  static const NEWS = "/news";

  static Route<dynamic> getRoute(String routeName) {
    switch (routeName) {
      case Routes.LOGIN:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
        break;

      case Routes.SIGNUP:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
        break;

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text("404"),
            ),
            body: Center(
              child: Text("Página não existe"),
            ),
          ),
        );
        break;
    }
  }

  static Route<dynamic> generate(RouteSettings settings) {
    return getRoute(settings.name);
  }
}
