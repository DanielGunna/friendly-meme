import 'package:teste_boticario/controllers/base_controller.dart';
import 'package:teste_boticario/data/model/user_model.dart';
import 'package:teste_boticario/stores/user_store.dart';
import 'package:teste_boticario/views/viewmodels/sign_up_viewmodel.dart';

class SignUpController extends BaseController {
  final UserStore store;

  SignUpController({this.store});

  Future<UserModel> createUser(SignUpViewModel model) async {
    model.isLoading = true;
    onNotifyState();
    var user = await store
        .createUser(model.name, model.password, model.email)
        .whenComplete(() {
      model.isLoading = false;
      onNotifyState();
    });
    return user;
  }
}
