import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_boticario/controllers/create_post_controller.dart';
import 'package:teste_boticario/data/model/post_model.dart';
import 'package:teste_boticario/utils/injection.dart';
import 'package:teste_boticario/views/viewmodels/create_post_viewmodel.dart';
import 'package:teste_boticario/views/widgets/commons.dart';
import 'package:teste_boticario/views/widgets/text_field_widget.dart';
import 'package:teste_boticario/views/widgets/rounded_corner_buttom_widget.dart';

class CreatePostScreen extends StatefulWidget {
  final PostModel postModel;
  CreatePostScreen({Key key, this.postModel}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _createPostController = inject<CreatePostController>();
  final _createPostViewModel = inject<CreatePostViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _createPostViewModel.postModel = widget.postModel;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final future = _createPostController.postStore.postStateFuture;
      switch (future.status) {
        case FutureStatus.rejected:
          showSnackBar(_scaffoldKey, future.error.toString());
          break;
        case FutureStatus.fulfilled:
          if (future.result != null) {
            _createPostController.postStore.clearState();
            safePop(context);
          }
          break;
        default:
          break;
      }

      return Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(
            widget.postModel == null ? "Criar postagem" : "Editar postagem",
            context),
        body: buildScreenContent(context, future),
      );
    });
  }

  Widget buildScreenContent(
      BuildContext context, ObservableFuture<void> future) {
    return SingleChildScrollView(
        child: Padding(
      child: buildForm(future),
      padding: EdgeInsets.all(16),
    ));
  }

  Widget buildPostField() {
    return EditText(
      hint: "Digite sua postagem",
      maxLength: 200,
      inputType: TextInputType.multiline,
      hideLengthIndicator: false,
      onValidField: (value) => _createPostViewModel.content = value,
      value: widget.postModel == null ? "" : widget.postModel.body,
    );
  }

  Widget buildCreatePostButton() {
    return RoundedCornerButton(
      text: widget.postModel == null ? "Criar postagem" : "Editar postagem",
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          if (widget.postModel == null)
            _createPostController.createPost(_createPostViewModel);
          else
            _createPostController.editPost(_createPostViewModel);
        }
      },
    );
  }

  Widget buildForm(ObservableFuture<void> future) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildPostField(),
          SizedBox(height: 100),
          future.status == FutureStatus.pending
              ? buildLoading()
              : buildCreatePostButton()
        ],
      ),
    );
  }
}
