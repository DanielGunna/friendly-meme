import 'package:flutter/material.dart';
import 'package:teste_boticario/controllers/sign_up_controller.dart';
import 'package:teste_boticario/routes/routes.dart';
import 'package:teste_boticario/utils/injection.dart';
import 'package:teste_boticario/views/viewmodels/sign_up_viewmodel.dart';
import 'package:teste_boticario/views/widgets/rounded_corner_buttom_widget.dart';
import 'package:teste_boticario/views/widgets/commons.dart';
import 'package:teste_boticario/views/widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signupController = inject<SignUpController>();
  final _signUpViewModel = inject<SignUpViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _signupController.attachStateNotifier(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
          key: _formKey,
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
                _signUpViewModel.isLoading
                    ? Commons.buildLoading()
                    : buildSignUpButton(),
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
      onValidField: (value) => _signUpViewModel.name = value,
    );
  }

  Widget buildEmailField() {
    return EditText(
      hint: "Digite seu E-mail",
      inputType: TextInputType.emailAddress,
      emptyMessage: "Informe o e-mail por favor",
      onValidField: (value) => _signUpViewModel.email = value,
    );
  }

  Widget buildPasswordField() {
    return EditText(
      hint: "Digite sua Senha",
      inputType: TextInputType.visiblePassword,
      obscureText: true,
      emptyMessage: "É necessário informar a senha",
      onValidField: (value) => _signUpViewModel.password = value,
    );
  }

  Widget buildSignUpButton() {
    return RoundedCornerButton(
      text: "Criar conta",
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          _signupController.createUser(_signUpViewModel).then((data) {
            Navigator.pop(context);
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
