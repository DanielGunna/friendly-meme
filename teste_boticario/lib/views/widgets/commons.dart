import 'package:flutter/material.dart';

class Commons {
  static Widget buildAppBar(String title, BuildContext context) {
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

  static void showSnackBar(GlobalKey<ScaffoldState> key, String error) {
    key.currentState.showSnackBar(SnackBar(
      content: new Text('Erro: $error'),
      duration: new Duration(seconds: 10),
    ));
  }

  static Widget buildLoading() {
    return Center(
      child: Container(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
