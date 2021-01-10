import 'package:flutter/material.dart';
import 'package:teste_boticario/demo_values.dart';
import 'package:teste_boticario/views/feed/post_card.dart';
import 'package:teste_boticario/views/widgets/commons.dart';
import 'package:teste_boticario/routes/routes.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Commons.buildAppBar("Feed", context),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            {Navigator.push(context, Routes.getRoute(Routes.CREATE_POST))},
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: DemoValues.posts.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(postData: DemoValues.posts[index]);
        },
      ),
    );
  }
}
