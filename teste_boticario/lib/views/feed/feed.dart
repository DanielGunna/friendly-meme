import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_boticario/controllers/feed_controller.dart';
import 'package:teste_boticario/data/model/post_model.dart';
import 'package:teste_boticario/utils/injection.dart';
import 'package:teste_boticario/views/feed/post_card.dart';
import 'package:teste_boticario/views/widgets/commons.dart';
import 'package:teste_boticario/routes/routes.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({Key key}) : super(key: key);
  final _feedController = inject<FeedController>();

  @override
  Widget build(BuildContext context) {
    _feedController.getAllPosts();
    return Scaffold(
        appBar: buildAppBar("Feed", context),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            push(context, Routes.CREATE_POST).then((value) {
              _feedController.getAllPosts();
            })
          },
          backgroundColor: Colors.orange,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: RefreshIndicator(
            onRefresh: () => _feedController.getAllPosts(),
            child: Observer(
              builder: (_) {
                final posts = _feedController.postStore.postsFuture;
                return posts.status == FutureStatus.pending
                    ? buildLoading()
                    : (posts.status == FutureStatus.fulfilled
                        ? builListItems(posts)
                        : Center(child: Text(posts.error.toString())));
              },
            )));
  }

  builListItems(ObservableFuture<List<PostModel>> posts) {
    return ListView.builder(
      itemCount: posts.result.length,
      itemBuilder: (BuildContext context, int index) {
        return PostCard(
            feedController: _feedController, postData: posts.result[index]);
      },
    );
  }
}
