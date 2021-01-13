import 'package:flutter/material.dart';
import 'package:teste_boticario/controllers/create_post_controller.dart';
import 'package:teste_boticario/controllers/feed_controller.dart';
import 'package:teste_boticario/data/model/post_model.dart';

class InheritedPostModel extends InheritedWidget {
  final PostModel postData;
  final Widget child;
  final FeedController feedController;
  InheritedPostModel(
      {Key key, @required this.postData, this.child, this.feedController})
      : super(key: key, child: child);

  static InheritedPostModel of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedPostModel>();
  }

  @override
  bool updateShouldNotify(InheritedPostModel oldWidget) {
    return true;
  }
}
