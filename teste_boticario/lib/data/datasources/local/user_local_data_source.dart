import 'package:sqflite/sqflite.dart';
import 'package:teste_boticario/data/entity/user_entity.dart';
import 'package:teste_boticario/data/storage/database.dart';

abstract class UserLocalDataSource {
  Future<UserEntity> verifyUserExits(String userEmail, String userPassword);
  Future<UserEntity> insertUser(UserEntity user);
  Future<UserEntity> getUserById(String id);
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
    return verifyResult(values, (value) {
      return value['password'].toString() == userPassword;
    });
  }

  @override
  Future<UserEntity> getUserById(String id) async {
    List<Map<String, dynamic>> values = await database.query(
      USER_TABLE,
      where: '$USER_ID_COLUMN = ?',
      whereArgs: [id],
    );
    return verifyResult(values, (value) {
      return value['id'].toString() == id;
    });
  }

  UserEntity getUserWithInfos(
      List<Map<String, dynamic>> values, Function predicate) {
    var user = values.firstWhere(
      (value) => predicate(value),
      orElse: () => null,
    );

    if (user != null)
      return UserEntity.fromMap(user);
    else
      return null;
  }

  Future<UserEntity> verifyResult(
      List<Map<String, dynamic>> values, Function predicate) async {
    if (values.isEmpty) {
      return Future.error("Usuário não encontrado!");
    } else {
      UserEntity user = getUserWithInfos(values, predicate);
      if (user == null)
        return Future.error("Usuário não encontrado!");
      else
        return user;
    }
  }
}
