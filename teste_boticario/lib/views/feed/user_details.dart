import 'package:flutter/material.dart';
import 'package:teste_boticario/data/model/user_model.dart';
import 'package:teste_boticario/views/widgets/inherited_user_model.dart';

class UserDetails extends StatelessWidget {
  final UserModel userData;

  const UserDetails({Key key, @required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedUserModel(
      userData: userData,
      child: Container(
        child: Row(children: <Widget>[_UserImage(), _UserNameAndEmail()]),
      ),
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel userData = InheritedUserModel.of(context).userData;
    final TextStyle nameTheme = Theme.of(context).textTheme.subtitle2;
    final TextStyle emailTheme = Theme.of(context).textTheme.bodyText2;
    final int flex = 5;

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(userData.name, style: nameTheme),
            SizedBox(height: 2.0),
            Text(userData.email, style: emailTheme),
          ],
        ),
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel userData = InheritedUserModel.of(context).userData;
    print(userData.image);
    return Expanded(
      flex: 1,
      child: CircleAvatar(backgroundImage: NetworkImage(userData.image)),
    );
  }
}
