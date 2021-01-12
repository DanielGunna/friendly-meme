import 'package:http/http.dart' as http;
import 'package:teste_boticario/data/repositories/response/post_response.dart';

abstract class PostRemoteDataSource {
  Future<PostResponse> getPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({this.client});

  @override
  Future<PostResponse> getPosts() async {}
}
