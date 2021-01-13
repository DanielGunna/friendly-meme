import 'package:teste_boticario/data/model/post_model.dart';
import 'package:teste_boticario/stores/post_store.dart';

class FeedController {
  final PostStore postStore;

  FeedController({this.postStore});

  Future<void> getAllPosts() async {
    postStore.getAllPosts();
  }

  Future<void> removePost(PostModel data) async {
    postStore.deletePost(data.id);
  }
}
