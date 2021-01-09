import 'package:flutter/material.dart';
import 'package:teste_boticario/demo_values.dart';
import 'package:teste_boticario/screens/feed/post_card.dart';


class FeedScreen extends StatelessWidget {
  const FeedScreen({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed"),
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