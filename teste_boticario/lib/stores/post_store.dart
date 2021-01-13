import 'package:mobx/mobx.dart';
import 'package:teste_boticario/data/model/post_model.dart';
import 'package:teste_boticario/data/repositories/posts_repository.dart';

part 'post_store.g.dart';

class PostStore extends _PostStore with _$PostStore {
  PostStore(PostRepository postRepository) : super(repository: postRepository);
}

abstract class _PostStore with Store {
  @observable
  ObservableFuture<List<PostModel>> postsFuture = ObservableFuture.value([]);

  @observable
  ObservableFuture<PostModel> postStateFuture = ObservableFuture.value(null);

  @action
  Future<void> getAllPosts() async {
    postsFuture = ObservableFuture(repository.getAllPosts());
    return postsFuture;
  }

  @action
  Future<void> deletePost(String postId) async {
    await repository.deletePost(postId);
    final list = postsFuture.value;
    list.removeWhere((item) => item.id == postId);
    postsFuture = ObservableFuture.value(list);
    return postsFuture;
  }

  @action
  Future<PostModel> editPost(PostModel postModel) async {
    postStateFuture = ObservableFuture(repository.updatePost(postModel));
    final list = postsFuture.value;
    for (PostModel item in list) {
      if (item.id == postModel.id) {
        item.body = postModel.body;
        break;
      }
    }
    postsFuture = ObservableFuture.value(list);
    return postStateFuture;
  }

  @action
  void clearState() {
    postStateFuture = ObservableFuture.value(null);
  }

  @action
  Future<PostModel> createPost(String content) async {
    postStateFuture = ObservableFuture(repository.createPost(content));
    return postStateFuture;
  }

  final PostRepository repository;
  _PostStore({this.repository});
}
