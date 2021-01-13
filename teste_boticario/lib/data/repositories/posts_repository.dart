import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_boticario/data/datasources/local/post_local_data_source.dart';
import 'package:teste_boticario/data/datasources/local/user_local_data_source.dart';
import 'package:teste_boticario/data/datasources/remote/post_remote_data_source.dart';
import 'package:teste_boticario/data/entity/post_entity.dart';
import 'package:teste_boticario/data/mappers/post_mappers.dart';
import 'package:teste_boticario/data/model/post_model.dart';
import 'package:teste_boticario/data/storage/preferences.dart';

import 'package:teste_boticario/utils/network_info.dart';

abstract class PostRepository {
  Future<PostModel> createPost(String content);
  Future<List<PostModel>> getAllPosts();
  Future deletePost(String postId);
  Future updatePost(PostModel post);
}

class PostRepositoryImpl extends PostRepository {
  final PostLocalDataSource localDataSource;
  final PostRemoteDataSource remoteDataSource;
  final UserLocalDataSource userLocalDataSource;
  final NetworkInfo networkInfo;
  final SharedPreferences preferences;

  PostRepositoryImpl(
      {this.networkInfo,
      this.localDataSource,
      this.remoteDataSource,
      this.userLocalDataSource,
      this.preferences});

  @override
  Future<PostModel> createPost(String content) async {
    final currentUserId = preferences.getInt(PREFS_USER_ID_KEY);
    final entity = PostEntity(content: content, userId: currentUserId);
    return fromPostEntityCreate(await localDataSource.createPost(entity));
  }

  @override
  Future deletePost(String postId) async {
    return await localDataSource.deletePost(int.parse(postId));
  }

  @override
  Future<List<PostModel>> getAllPosts() async {
    final currentUserId = preferences.getInt(PREFS_USER_ID_KEY);
    var allItems = List<PostModel>();
    if (await networkInfo.isConnected) {
      var remoteItems = await remoteDataSource.getPosts();
      allItems.addAll(fromPostListResponse(remoteItems.news));
    }
    var localItems = await localDataSource.getAllPosts();
    for (PostEntity item in localItems) {
      final postUser =
          await userLocalDataSource.getUserById(item.userId.toString());
      allItems.add(fromPostEntity(item, postUser, currentUserId.toString()));
    }
    return allItems;
  }

  @override
  Future updatePost(PostModel post) async {
    return await localDataSource.updatePost(toPostEntity(post));
  }
}
