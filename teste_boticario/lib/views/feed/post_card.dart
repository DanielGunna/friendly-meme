import 'package:flutter/material.dart';
import 'package:teste_boticario/model/post_model.dart';
import 'package:teste_boticario/views/widgets/inherited_post_model.dart';
import 'package:teste_boticario/views/feed/user_details.dart';
import 'post_stats.dart';

class PostCard extends StatelessWidget {
  final PostModel postData;

  const PostCard({Key key, @required this.postData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double aspectRatio = 6 / 3;

    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Card(
          elevation: 2,
          child: Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.all(4.0),
            child: InheritedPostModel(
              postData: postData,
              child: Column(
                children: [
                  _PostDetails(),
                  Divider(color: Colors.grey),
                  _PostContent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PostContent extends StatelessWidget {
  const _PostContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;
    final TextStyle summaryTheme = Theme.of(context).textTheme.bodyText2;
    final String summary = postData.summary;

    return Expanded(
      flex: 3,
      child: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Row(
            children: [Text(summary, style: summaryTheme)],
          )),
    );
  }
}

class _PostDetails extends StatelessWidget {
  const _PostDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostModel postData = InheritedPostModel.of(context).postData;

    return Row(
      children: checkIsFromUser(postData),
    );
  }

  List<Widget> checkIsFromUser(PostModel postData) {
    List<Widget> views = List<Widget>();
    views.add(Expanded(flex: 3, child: UserDetails(userData: postData.author)));
    if (postData.createdByUser)
      views.add(Expanded(flex: 1, child: PostOptions()));
    return views;
  }
}
