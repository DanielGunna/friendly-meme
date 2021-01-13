import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teste_boticario/data/repositories/response/post_response.dart';

abstract class PostRemoteDataSource {
  Future<PostResponse> getPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({this.client});

  @override
  Future<PostResponse> getPosts() async {
    final response = await client
        .get('https://gb-mobile-app-teste.s3.amazonaws.com/data.json');

    if (response.statusCode == 200) {
      return PostResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Erro ao listar postagens');
    }
  }
}
