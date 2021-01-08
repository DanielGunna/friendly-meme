import 'package:flutter/material.dart';
import 'package:teste_boticario/routes/routes.dart';
import 'package:teste_boticario/screens/login/linear_background_widget.dart';
import 'package:teste_boticario/screens/widgets/boticario_logo_widget.dart';
import 'package:teste_boticario/screens/widgets/rounded_corner_buttom_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LinearBackgroundWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [buildLoginForm(context), buildSignUpButtom()],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Card(
        child: Container(
      height: getLoginFormHeight(context),
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BoticarioLogoWidget(),
              buildLoginField(),
              buildPasswordField(),
              buildLoginButton()
            ],
          ),
        ),
      ),
    ));
  }

  double getLoginFormHeight(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.50
          : MediaQuery.of(context).size.height * 0.70;

  Widget buildLoginField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "E-maill",
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
          labelText: "Senha",
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

  Widget buildLoginButton() {
    return RoundedCornerButton(
      text: "Entrar",
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
        onPressed: () {
          Navigator.push(context, Routes.getRoute(Routes.SIGNUP));
        },
      ),
    );
  }
}
