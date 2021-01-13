import 'package:flutter/material.dart';
import 'package:teste_boticario/routes/routes.dart';
import 'package:teste_boticario/views/widgets/commons.dart';
import 'package:teste_boticario/views/widgets/inherited_post_model.dart';

class PostOptions extends StatelessWidget {
  const PostOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = InheritedPostModel.of(context).feedController;
    final data = InheritedPostModel.of(context).postData;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            controller.removePost(data);
          },
          child: _ActionOption(
            icon: Icons.delete,
            color: Colors.red,
          ),
        ),
        GestureDetector(
          onTap: () {
            pushParam(context, Routes.CREATE_POST, data);
          },
          child: _ActionOption(
            icon: Icons.edit,
            color: Colors.green[900],
          ),
        )
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
