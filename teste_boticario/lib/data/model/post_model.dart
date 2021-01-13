import 'package:flutter/material.dart';
import 'package:teste_boticario/data/model/user_model.dart';

class PostModel {
  final String id;
  String body;
  final String postTime;
  final UserModel author;
  final bool createdByUser;

  PostModel({
    @required this.id,
    this.body,
    @optionalTypeArgs this.author,
    @required this.postTime,
    @required this.createdByUser,
  });
}
