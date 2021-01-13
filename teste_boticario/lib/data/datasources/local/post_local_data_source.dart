import 'package:sqflite/sqflite.dart';
import 'package:teste_boticario/data/entity/post_entity.dart';
import 'package:teste_boticario/data/storage/database.dart';

abstract class PostLocalDataSource {
  Future<void> deletePost(int postId);
  Future<PostEntity> createPost(PostEntity entity);
  Future<List<PostEntity>> getAllPosts();
  Future<void> updatePost(PostEntity postEntity);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final Database database;

  PostLocalDataSourceImpl({this.database});

  @override
  Future<PostEntity> createPost(PostEntity post) async {
    await database.insert(POST_TABLE, post.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return post;
  }

  @override
  Future<void> deletePost(int postId) async {
    return await database
        .delete(POST_TABLE, where: '$POST_ID_COLUMN = ?', whereArgs: [postId]);
  }

  @override
  Future<List<PostEntity>> getAllPosts() async {
    var values = await database.query(POST_TABLE);
    return values.map((map) => PostEntity.fromMap(map)).toList();
  }

  @override
  Future<void> updatePost(PostEntity entity) async {
    await database.update(POST_TABLE, entity.toMap(),
        where: '$POST_ID_COLUMN = ?', whereArgs: [entity.id]);
  }
}
