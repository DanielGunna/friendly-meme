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

  final _$loginUserAsyncAction = AsyncAction('loginUser');

  @override
  Future<UserModel> loginUser(String password, String email) {
    return _$loginUserAsyncAction.run(() => super.loginUser(password, email));
  }
}
