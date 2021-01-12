import 'package:teste_boticario/data/entity/user_entity.dart';
import 'package:teste_boticario/data/model/user_model.dart';
import 'package:teste_boticario/data/repositories/response/user_reponse.dart';

UserEntity toDatabaseEntity(UserModel model, String password) => UserEntity(
      name: model.name,
      email: model.email,
      password: password,
    );

UserModel fromDatabaseEntity(UserEntity entity) => UserModel(
      name: entity.name,
      email: entity.email,
      image: "",
      id: entity.id.toString(),
    );

UserModel fromResponse(UserResponse response) => UserModel(
      name: response.name,
      email: "",
      image: response.profilePicture,
      id: "",
    );
