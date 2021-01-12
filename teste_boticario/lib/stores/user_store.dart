import 'package:mobx/mobx.dart';
import 'package:teste_boticario/data/model/user_model.dart';
import 'package:teste_boticario/data/repositories/user_repository.dart';

part 'user_store.g.dart';

class UserStore extends _UserStore with _$UserStore {
  UserStore(UserRepository repository) : super(repository: repository);
}

abstract class _UserStore with Store {
  @observable
  UserModel userLogged;

  final UserRepository repository;
  _UserStore({this.repository});

  @action
  Future<UserModel> loginUser(String password, String email) async {
    var result = await repository
        .login(email, password)
        .then((data) => userLogged = data);
    return result;
  }
}
