import 'dart:math';

import 'package:teste_boticario/data/entity/post_entity.dart';
import 'package:teste_boticario/data/entity/user_entity.dart';
import 'package:teste_boticario/data/mappers/user_mappers.dart';
import 'package:teste_boticario/data/model/post_model.dart';
import 'package:teste_boticario/data/repositories/response/news_response.dart';

PostModel fromPostEntity(
        PostEntity entity, UserEntity userEntity, String currentUserId) =>
    PostModel(
        id: entity.id.toString(),
        createdByUser: userEntity.id.toString() == currentUserId,
        author: fromUserEntity(userEntity),
        body: entity.content,
        postTime: entity.createdAt);

PostModel fromPostEntityCreate(PostEntity entity, UserEntity author) =>
    PostModel(
        id: entity.id.toString(),
        createdByUser: true,
        author: fromUserEntity(author),
        body: entity.content,
        postTime: entity.createdAt);

PostModel fromPostResponse(NewsResponse response) => PostModel(
    id: "",
    createdByUser: false,
    body: response.message.content,
    postTime: response.message.createdAt,
    author: fromUserResponse(response.user));

List<PostModel> fromPostListResponse(List<NewsResponse> responses) =>
    responses.map((response) {
      return fromPostResponse(response);
    }).toList();

PostEntity toPostEntity(PostModel model) => PostEntity(
      id: int.parse(model.id) ?? -1,
      content: model.body,
      userId: int.parse(model.author.id),
    );
