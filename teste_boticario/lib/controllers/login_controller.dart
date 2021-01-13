import 'package:teste_boticario/controllers/base_controller.dart';
import 'package:teste_boticario/data/model/user_model.dart';
import 'package:teste_boticario/stores/user_store.dart';
import 'package:teste_boticario/views/viewmodels/login_viewmodel.dart';

class LoginController extends BaseController {
  final UserStore store;

  LoginController({this.store});

  void loginUser(LoginViewModel model) async {
    model.isLoading = true;
    onNotifyState();
    await store.loginUser(model.password, model.email).whenComplete(() {
      model.isLoading = false;
      onNotifyState();
    });
  }
}
