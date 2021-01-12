import 'dart:async';

import 'package:teste_boticario/data/datasources/local/user_local_data_source.dart';
import 'package:teste_boticario/data/mappers/user_mappers.dart';
import 'package:teste_boticario/data/model/user_model.dart';

import 'package:teste_boticario/utils/network_info.dart';

abstract class UserRepository {
  Future<void> signUp();
  Future<UserModel> login(String email, String password);
}

class UserRepositoryImpl extends UserRepository {
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({this.networkInfo, this.localDataSource});

  @override
  Future<UserModel> login(String email, String password) async {
    return fromDatabaseEntity(await localDataSource.verifyUserExits(
      email,
      password,
    ));
  }

  @override
  Future<void> signUp() {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
