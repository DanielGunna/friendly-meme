import 'package:flutter/material.dart';
import 'package:teste_boticario/views/widgets/commons.dart';
import 'package:teste_boticario/views/widgets/text_field_widget.dart';
import 'package:teste_boticario/views/widgets/rounded_corner_buttom_widget.dart';

class CreatePostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Commons.buildAppBar("Criar postagem", context),
      body: buildScreenContent(context),
    );
  }

  Widget buildScreenContent(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildPostField(),
          SizedBox(height: 100),
          buildCreatePostButton()
        ],
      ),
      padding: EdgeInsets.all(16),
    ));
  }

  Widget buildPostField() {
    return EditText(
      hint: "Digite sua postagem",
      maxLength: 200,
      inputType: TextInputType.multiline,
      hideLengthIndicator: false,
    );
  }

  Widget buildCreatePostButton() {
    return RoundedCornerButton(
      text: "Criar postagem",
      onPressed: () {},
    );
  }
}
