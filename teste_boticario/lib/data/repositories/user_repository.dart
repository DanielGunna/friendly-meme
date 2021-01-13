import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_boticario/data/datasources/local/user_local_data_source.dart';
import 'package:teste_boticario/data/entity/user_entity.dart';
import 'package:teste_boticario/data/mappers/user_mappers.dart';
import 'package:teste_boticario/data/model/user_model.dart';
import 'package:teste_boticario/data/storage/preferences.dart';
import 'package:teste_boticario/utils/network_info.dart';

abstract class UserRepository {
  Future<UserModel> signUp(String email, String password, String name);
  Future<UserModel> login(String email, String password);
  bool isUserLogged();
}

class UserRepositoryImpl extends UserRepository {
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final SharedPreferences preferences;

  UserRepositoryImpl({
    this.networkInfo,
    this.localDataSource,
    this.preferences,
  });

  @override
  Future<UserModel> login(String email, String password) async =>
      fromUserEntity(await localDataSource
          .verifyUserExits(
        email,
        password,
      )
          .then((value) {
        preferences.setBool(PREFS_USER_LOGGED_KEY, true);
        preferences.setInt(PREFS_USER_ID_KEY, value.id);
        return value;
      }));

  @override
  Future<UserModel> signUp(String email, String password, String name) async =>
      fromUserEntity(await localDataSource.insertUser(UserEntity(
        name: name,
        password: password,
        email: email,
      )));

  @override
  bool isUserLogged() {
    var logged = preferences.getBool(PREFS_USER_LOGGED_KEY) ?? false;
    return logged;
  }
}
