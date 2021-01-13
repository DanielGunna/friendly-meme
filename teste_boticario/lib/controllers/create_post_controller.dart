import 'package:teste_boticario/stores/post_store.dart';
import 'package:teste_boticario/views/viewmodels/create_post_viewmodel.dart';

class CreatePostController {
  final PostStore postStore;

  CreatePostController({this.postStore});

  void createPost(CreatePostViewModel model) async {
    model.isLoading = true;
    await postStore.createPost(model.content);
    model.isLoading = false;
  }

  void editPost(CreatePostViewModel model) async {
    model.isLoading = true;
    model.postModel.body = model.content;
    await postStore.editPost(model.postModel);
    model.isLoading = false;
  }
}
