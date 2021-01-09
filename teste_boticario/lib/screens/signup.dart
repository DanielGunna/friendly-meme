import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teste_boticario/screens/widgets/rounded_corner_buttom_widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(), 
      body: buildScreenContent(context)
      );
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: "Digite seu nome",
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "Informe seu nome por favor";
          }
          return null;
        },
      ),
    );
  }

  Widget buildEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Digite seu E-mail",
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "Informe o e-mail por favor";
          }
          return null;
        },
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Digite sua Senha",
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "É necessário informar a senha";
          }
          return null;
        },
      ),
    );
  }

  Widget buildSignUpButton() {
    return RoundedCornerButton(
      text: "Criar conta",
      onPressed: () {},
    );
  }

  Widget buildSignUpButtom() {
    return Container(
      child: FlatButton(
        child: Text(
          "Cadastrar",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget buildAppBar() {
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
        "Cadastro",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
