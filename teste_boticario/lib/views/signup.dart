import 'package:flutter/material.dart';
import 'package:teste_boticario/views/widgets/rounded_corner_buttom_widget.dart';
import 'package:teste_boticario/views/widgets/commons.dart';
import 'package:teste_boticario/views/widgets/text_field_widget.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Commons.buildAppBar("Cadastre-se", context),
        body: buildScreenContent(context));
  }

  Widget buildScreenContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          buildDescriptionText(),
          Padding(
            child: buildSignUpForm(context),
            padding: EdgeInsets.all(16),
          )
        ],
      ),
    );
  }

  Widget buildDescriptionText() {
    return Padding(
      child: Text(
        "Insira as suas informações de cadastro abaixo",
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      padding: EdgeInsets.all(16),
    );
  }

  double getSignupFormHeight(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.70
          : MediaQuery.of(context).size.height * 0.50;

  Widget buildSignUpForm(BuildContext context) {
    return Container(
      height: getSignupFormHeight(context),
      child: Card(
        elevation: 8,
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildNameField(),
                buildEmailField(),
                buildPasswordField(),
                buildSignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNameField() {
    return EditText(
      hint: "Digite seu Nome",
      inputType: TextInputType.emailAddress,
      emptyMessage: "Informe seu nome por favor",
    );
  }

  Widget buildEmailField() {
    return EditText(
      hint: "Digite seu E-mail",
      inputType: TextInputType.emailAddress,
      emptyMessage: "Informe o e-mail por favor",
    );
  }

  Widget buildPasswordField() {
    return EditText(
      hint: "Digite sua Senha",
      inputType: TextInputType.visiblePassword,
      obscureText: true,
      emptyMessage: "É necessário informar a senha",
    );
  }

  Widget buildSignUpButton() {
    return RoundedCornerButton(
      text: "Criar conta",
      onPressed: () {},
    );
  }
}
