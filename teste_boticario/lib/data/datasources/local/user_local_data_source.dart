import 'package:sqflite/sqflite.dart';
import 'package:teste_boticario/data/database/database.dart';
import 'package:teste_boticario/data/entity/user_entity.dart';

abstract class UserLocalDataSource {
  Future<UserEntity> verifyUserExits(String email, String password);
  Future<void> insertUser(UserEntity user);
}

class UserLocalSourceImpl implements UserLocalDataSource {
  final Database database;

  UserLocalSourceImpl({this.database});

  @override
  Future<void> insertUser(UserEntity user) async {
    await database.insert(USER_TABLE, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<UserEntity> verifyUserExits(String email, String password) async {
    List<Map<String, dynamic>> values = await database.query(
      USER_TABLE,
      where: " email ?",
      whereArgs: [email],
    );
    if (values.isEmpty) {
      return Future.error("Usuário não encontrado!");
    } else {
      UserEntity user = getUserWithInfos(values, password);
      if (user == null)
        return Future.error("Dados inválidos!");
      else
        return Future.value(user);
    }
  }

  UserEntity getUserWithInfos(
      List<Map<String, dynamic>> values, String password) {
    return List.generate(values.length, (index) {
      return UserEntity.fromMap(
        values[index],
      );
    }).firstWhere(
      (user) => user.password == password,
      orElse: () => null,
    );
  }
}
