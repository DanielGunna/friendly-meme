import 'package:flutter/material.dart';

class PostOptions extends StatelessWidget {
  const PostOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ActionOption(
          icon: Icons.delete,
          color: Colors.red,
        ),
        _ActionOption(
          icon: Icons.edit,
          color: Colors.green[900],
        ),
      ],
    );
  }
}

class _ActionOption extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _ActionOption({
    Key key,
    @required this.icon,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: Icon(icon, color: color),
        ),
      ],
    );
  }
}
