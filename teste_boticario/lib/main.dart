import 'package:flutter/material.dart';
import 'package:teste_boticario/utils/injection.dart';
import 'package:teste_boticario/views/splash.dart';

void main() async {
  await setupInjection();
  await injectionInstance.allReady();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste boticario',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
