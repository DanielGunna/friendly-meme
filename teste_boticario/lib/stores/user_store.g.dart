// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$userLoggedAtom = Atom(name: '_UserStore.userLogged');

  @override
  UserModel get userLogged {
    _$userLoggedAtom.context.enforceReadPolicy(_$userLoggedAtom);
    _$userLoggedAtom.reportObserved();
    return super.userLogged;
  }

  @override
  set userLogged(UserModel value) {
    _$userLoggedAtom.context.conditionallyRunInAction(() {
      super.userLogged = value;
      _$userLoggedAtom.reportChanged();
    }, _$userLoggedAtom, name: '${_$userLoggedAtom.name}_set');
  }

  final _$hasLoginAtom = Atom(name: '_UserStore.hasLogin');

  @override
  bool get hasLogin {
    _$hasLoginAtom.context.enforceReadPolicy(_$hasLoginAtom);
    _$hasLoginAtom.reportObserved();
    return super.hasLogin;
  }

  @override
  set hasLogin(bool value) {
    _$hasLoginAtom.context.conditionallyRunInAction(() {
      super.hasLogin = value;
      _$hasLoginAtom.reportChanged();
    }, _$hasLoginAtom, name: '${_$hasLoginAtom.name}_set');
  }

  final _$loginFutureAtom = Atom(name: '_UserStore.loginFuture');

  @override
  ObservableFuture<void> get loginFuture {
    _$loginFutureAtom.context.enforceReadPolicy(_$loginFutureAtom);
    _$loginFutureAtom.reportObserved();
    return super.loginFuture;
  }

  @override
  set loginFuture(ObservableFuture<void> value) {
    _$loginFutureAtom.context.conditionallyRunInAction(() {
      super.loginFuture = value;
      _$loginFutureAtom.reportChanged();
    }, _$loginFutureAtom, name: '${_$loginFutureAtom.name}_set');
  }

  final _$createUserFutureAtom = Atom(name: '_UserStore.createUserFuture');

  @override
  ObservableFuture<void> get createUserFuture {
    _$createUserFutureAtom.context.enforceReadPolicy(_$createUserFutureAtom);
    _$createUserFutureAtom.reportObserved();
    return super.createUserFuture;
  }

  @override
  set createUserFuture(ObservableFuture<void> value) {
    _$createUserFutureAtom.context.conditionallyRunInAction(() {
      super.createUserFuture = value;
      _$createUserFutureAtom.reportChanged();
    }, _$createUserFutureAtom, name: '${_$createUserFutureAtom.name}_set');
  }

  final _$loginUserAsyncAction = AsyncAction('loginUser');

  @override
  Future<dynamic> loginUser(String password, String email) {
    return _$loginUserAsyncAction.run(() => super.loginUser(password, email));
  }

  final _$createUserAsyncAction = AsyncAction('createUser');

  @override
  Future<dynamic> createUser(String name, String password, String email) {
    return _$createUserAsyncAction
        .run(() => super.createUser(name, password, email));
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void checkHasLogin() {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.checkHasLogin();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }
}
