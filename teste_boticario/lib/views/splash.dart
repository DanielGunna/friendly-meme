import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_boticario/routes/routes.dart';
import 'package:teste_boticario/stores/user_store.dart';
import 'package:teste_boticario/utils/injection.dart';
import 'package:teste_boticario/views/widgets/commons.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _userStore = inject<UserStore>();

  @override
  void initState() {
    super.initState();
    _userStore.checkHasLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Observer(
          builder: (_) {
            openNextScreen(_userStore.hasLogin, context);
            return Container();
          },
        ),
        Center(child: Image.asset("assets/images/ic_logo.png")),
        Center(
            child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Daniel Gunna'),
              Text('danielgunna1408@gmail.com'),
            ],
          ),
        ))
      ],
    ));
  }

  void openNextScreen(bool hasLogin, BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (hasLogin)
        pushReplacement(context, Routes.FEED);
      else
        pushReplacement(context, Routes.LOGIN);
    });
  }
}
