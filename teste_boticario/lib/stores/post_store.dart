import 'package:mobx/mobx.dart';
import 'package:teste_boticario/data/repositories/posts_repository.dart';

part 'post_store.g.dart';

class PostStore extends _PostStore with _$PostStore {
  PostStore(PostRepository postRepository) : super(repository: postRepository);
}

abstract class _PostStore with Store {
  final PostRepository repository;
  _PostStore({this.repository});
}
