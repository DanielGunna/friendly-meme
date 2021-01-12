import 'package:teste_boticario/stores/user_store.dart';
import 'package:teste_boticario/views/viewmodels/login_viewmodel.dart';

class LoginController {
  final UserStore store;

  LoginController({this.store});

  Future<void> loginUser(LoginViewModel model) async {
    model.isLoading = true;
    await store.loginUser(model.email, model.password);
    model.isLoading = false;
  }
}
