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
  @observable
  bool hasLogin;

  @observable
  ObservableFuture<void> loginFuture = ObservableFuture.value(null);
  @observable
  ObservableFuture<void> createUserFuture = ObservableFuture.value(null);

  final UserRepository repository;
  _UserStore({this.repository});

  @action
  Future loginUser(String password, String email) async {
    loginFuture = ObservableFuture(repository.login(email, password));
    return loginFuture;
  }

  @action
  Future createUser(String name, String password, String email) async {
    createUserFuture =
        ObservableFuture(repository.signUp(email, password, name));
    return createUserFuture;
  }

  @action
  void checkHasLogin() {
    hasLogin = repository.isUserLogged();
  }
}
