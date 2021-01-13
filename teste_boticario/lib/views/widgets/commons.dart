import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:teste_boticario/routes/routes.dart';

Widget buildAppBar(String title, BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () => {Navigator.pop(context)},
    ),
    backgroundColor: Colors.orange,
    title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
  );
}

void showSnackBar(GlobalKey<ScaffoldState> key, String error) {
  key.currentState.showSnackBar(SnackBar(
    content: new Text('Erro: $error'),
    duration: new Duration(seconds: 10),
  ));
}

Widget buildLoading() {
  return Center(
    child: Container(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    ),
  );
}

void safePushRelacement(BuildContext context, String route) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    pushReplacement(context, route);
  });
}

void pushReplacement(BuildContext context, String route) {
  Navigator.pushReplacement(context, Routes.getRoute(route, null));
}

void safePush(BuildContext context, String route) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    push(context, route);
  });
}

Future push(BuildContext context, String route) {
  return Navigator.push(context, Routes.getRoute(route, null));
}

void safePushParam(BuildContext context, String route, dynamic param) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    pushParam(context, route, param);
  });
}

void pushParam(BuildContext context, String route, dynamic param) {
  Navigator.push(context, Routes.getRoute(route, param));
}

void safePop(BuildContext context) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    Navigator.pop(context);
  });
}
