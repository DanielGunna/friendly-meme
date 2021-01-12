import 'package:flutter/material.dart';
import 'package:teste_boticario/controllers/login_controller.dart';
import 'package:teste_boticario/routes/routes.dart';
import 'package:teste_boticario/utils/injection.dart';
import 'package:teste_boticario/views/login/linear_background_widget.dart';
import 'package:teste_boticario/views/viewmodels/login_viewmodel.dart';
import 'package:teste_boticario/views/widgets/boticario_logo_widget.dart';
import 'package:teste_boticario/views/widgets/rounded_corner_buttom_widget.dart';
import 'package:teste_boticario/views/widgets/text_field_widget.dart';
import 'package:teste_boticario/views/widgets/commons.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = inject<LoginController>();
  final _loginViewModel = inject<LoginViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loginController.attachStateNotifier(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBackgroundWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildLoginForm(context),
                  buildSignUpButtom(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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

  Widget buildSignUpButtom(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text(
          "Cadastrar",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.push(
            context,
            Routes.getRoute(Routes.SIGNUP),
          );
        },
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Card(
        child: Container(
      height: getLoginFormHeight(context),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              BoticarioLogoWidget(),
              buildEmailField(),
              buildPasswordField(),
              _loginViewModel.isLoading
                  ? buildLoading()
                  : buildLoginButton(context)
            ],
          ),
        ),
      ),
    ));
  }

  double getLoginFormHeight(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * 0.70
          : MediaQuery.of(context).size.height * 0.70;

  Widget buildEmailField() {
    return EditText(
      hint: "Digite seu E-mail",
      inputType: TextInputType.emailAddress,
      emptyMessage: "Informe o e-mail por favor",
      onValidField: (value) => {_loginViewModel.email = value},
    );
  }

  Widget buildPasswordField() {
    return EditText(
      hint: "Digite sua Senha",
      inputType: TextInputType.visiblePassword,
      obscureText: true,
      emptyMessage: "É necessário informar a senha",
      onValidField: (value) => {_loginViewModel.password = value},
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return RoundedCornerButton(
      text: "Entrar",
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          _loginController.loginUser(_loginViewModel).then((data) {
            Navigator.pushReplacement(
              context,
              Routes.getRoute(Routes.FEED),
            );
          }, onError: (error) {
            Commons.showSnackBar(_scaffoldKey, error);
          }).catchError((error) {
            Commons.showSnackBar(_scaffoldKey, error);
          });
        }
      },
    );
  }
}
