import 'package:flutter/material.dart';
import 'package:teste_boticario/views/create_post.dart';
import 'package:teste_boticario/views/login/login.dart';
import 'package:teste_boticario/views/signup.dart';
import 'package:teste_boticario/views/feed/feed.dart';

class Routes {
  static const LOGIN = "/login";
  static const SIGNUP = "/signup";
  static const CREATE_POST = "/new_post";
  static const FEED = "/feed";

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
      case Routes.FEED:
        return MaterialPageRoute(
          builder: (context) => FeedScreen(),
        );
        break;
      case Routes.CREATE_POST:
        return MaterialPageRoute(
          builder: (context) => CreatePostScreen(),
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
