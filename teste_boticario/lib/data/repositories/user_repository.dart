import 'dart:async';
import 'dart:math';

import 'package:teste_boticario/data/datasources/local/user_local_data_source.dart';
import 'package:teste_boticario/data/entity/user_entity.dart';
import 'package:teste_boticario/data/mappers/user_mappers.dart';
import 'package:teste_boticario/data/model/user_model.dart';

import 'package:teste_boticario/utils/network_info.dart';

abstract class UserRepository {
  Future<UserModel> signUp(String email, String password, String name);
  Future<UserModel> login(String email, String password);
}

class UserRepositoryImpl extends UserRepository {
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({this.networkInfo, this.localDataSource});

  @override
  Future<UserModel> login(String email, String password) async =>
      fromDatabaseEntity(await localDataSource.verifyUserExits(
        email,
        password,
      ));

  @override
  Future<UserModel> signUp(String email, String password, String name) async =>
      fromDatabaseEntity(await localDataSource.insertUser(UserEntity(
        name: name,
        password: password,
        email: email,
      )));
}
