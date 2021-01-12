import 'package:teste_boticario/data/model/post_model.dart';

import 'data/model/user_model.dart';

class DemoValues {
  static final List<UserModel> users = [
    UserModel(
      id: "1",
      name: "Ishfar",
      email: "ishfar@gmail.com",
      image: "assets/images/user.jpg",
    ),
    UserModel(
      id: "2",
      name: "Ishrak",
      email: "ishrak@gmail.com",
      image: "assets/images/user.jpg",
    ),
    UserModel(
      id: "3",
      name: "Shakleen",
      email: "shakleen@gmail.com",
      image: "assets/images/user.jpg",
    ),
  ];

  static final String _body =
      """Aspernatur omnis consequatur dignissimos recusandae non. Praesentium nihil earum. Porro perspiciatis a velit doloremque consequatur impedit. Autem odio sed qui consequatur laboriosam sapiente omnis sit. Tenetur blanditiis iure molestias quidem odit numquam sunt aliquam.
 
Vitae libero perferendis voluptate et quasi aut impedit fuga. Maiores suscipit fugiat a est molestiae voluptas quasi earum recusandae. Ut omnis excepturi ut dolore ab.
 
Quia quo quisquam velit adipisci dolorem adipisci voluptatem. Eum ut quae et dolorem sapiente. Ut reprehenderit et ut voluptatum saepe et voluptatem. Sit eveniet quaerat.

Sit necessitatibus voluptatem est iste nihil nulla. Autem quasi sit et. Qui veniam fugit autem. Minima error deserunt fuga dolorum rerum provident velit.
 
Quod necessitatibus vel laboriosam ut id. Ab eaque eos voluptatem beatae tenetur repellendus adipisci repudiandae quisquam. Quis quam harum aspernatur nulla. Deleniti velit molestiae.
 
Repudiandae sint soluta ullam sunt eos id laborum. Veniam molestiae ipsa odit soluta in rerum amet. Deserunt rerum vero est eaque voluptas aspernatur ut voluptatem. Sint sed enim.""";

  static final List<PostModel> posts = [
    PostModel(
        id: "1",
        author: users[0],
        title: "Maple Trees",
        summary: "An in-depth study on maple trees.",
        body: "This is a short body.",
        imageURL: "assets/images/leaf.jpg",
        postTime: DateTime(2019, 11, 27, 7, 36),
        reacts: 123,
        views: 456,
        createdByUser: false),
    PostModel(
        id: "2",
        author: users[1],
        title: "Oak Trees",
        summary: "Preaching about oak trees",
        body: _body,
        imageURL: "assets/images/leaf.jpg",
        postTime: DateTime(2019, 4, 13),
        reacts: 321,
        views: 654,
        createdByUser: false),
    PostModel(
        id: "3",
        author: users[2],
        title: "Mango Trees",
        summary: "Gives shadow and fruit. Absolute win, no?",
        body: _body * 2,
        imageURL: "assets/images/leaf.jpg",
        postTime: DateTime(2019, 1, 12),
        reacts: 213,
        views: 546,
        createdByUser: true),
  ];
}
