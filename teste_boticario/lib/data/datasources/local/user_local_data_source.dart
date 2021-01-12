import 'package:sqflite/sqflite.dart';
import 'package:teste_boticario/data/database/database.dart';
import 'package:teste_boticario/data/entity/user_entity.dart';

abstract class UserLocalDataSource {
  Future<UserEntity> verifyUserExits(String userEmail, String userPassword);
  Future<UserEntity> insertUser(UserEntity user);
}

class UserLocalSourceImpl implements UserLocalDataSource {
  final Database database;

  UserLocalSourceImpl({this.database});

  @override
  Future<UserEntity> insertUser(UserEntity user) async {
    await database.insert(USER_TABLE, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return user;
  }

  @override
  Future<UserEntity> verifyUserExits(
      String userEmail, String userPassword) async {
    List<Map<String, dynamic>> values = await database.query(
      USER_TABLE,
      where: '$USER_EMAIL_COLUMN = ?',
      whereArgs: [userEmail],
    );
    if (values.isEmpty) {
      return Future.error("Usuário não encontrado!");
    } else {
      UserEntity user = getUserWithInfos(values, userPassword);
      if (user == null)
        return Future.error("Dados inválidos!");
      else
        return user;
    }
  }

  UserEntity getUserWithInfos(
      List<Map<String, dynamic>> values, String password) {
    var user = values.firstWhere(
      (value) => value['password'].toString() == password,
      orElse: () => null,
    );

    if (user != null)
      return UserEntity.fromMap(user);
    else
      return null;
  }
}
