import 'package:flutter/material.dart';
import 'package:teste_boticario/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(Routes.getRoute(Routes.LOGIN));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
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
}
