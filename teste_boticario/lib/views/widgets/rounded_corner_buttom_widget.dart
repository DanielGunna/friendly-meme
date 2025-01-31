import 'package:flutter/material.dart';

class RoundedCornerButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const RoundedCornerButton({Key key, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
