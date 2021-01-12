import 'package:teste_boticario/data/datasources/local/post_local_data_source.dart';
import 'package:teste_boticario/data/model/post_model.dart';

import 'package:teste_boticario/utils/network_info.dart';

abstract class PostRepository {
  Future<PostModel> createPost();
  Future<List<PostModel>> getAllPosts();
  Future deletePost();
  Future editPost();
}

class PostRepositoryImpl extends PostRepository {
  final PostLocalDataSource localDataSource;
  final PostLocalDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {this.networkInfo, this.localDataSource, this.remoteDataSource});

  @override
  Future<PostModel> createPost() {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future deletePost() {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future editPost() {
    // TODO: implement editPost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }
}
