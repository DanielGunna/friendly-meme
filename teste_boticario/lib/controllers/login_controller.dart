import 'package:teste_boticario/data/model/user_model.dart';
import 'package:teste_boticario/stores/user_store.dart';
import 'package:teste_boticario/views/viewmodels/login_viewmodel.dart';

class LoginController {
  final UserStore store;
  Function onNotifyState = () => {};

  LoginController({this.store});

  void attachStateNotifier(Function onNotify) {
    onNotifyState = onNotify;
  }

  Future<UserModel> loginUser(LoginViewModel model) async {
    model.isLoading = true;
    onNotifyState();
    return await store.loginUser(model.email, model.password).whenComplete(() {
      model.isLoading = false;
      onNotifyState();
    });
  }
}
