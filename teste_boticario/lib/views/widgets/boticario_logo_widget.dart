import 'package:flutter/material.dart';

class BoticarioLogoWidget extends StatelessWidget {
  const BoticarioLogoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Image.asset(
          "assets/images/ic_logo.png",
          width: 100,
          height: 100,
        )),
      ],
    );
  }
}
