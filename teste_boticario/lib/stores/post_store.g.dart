// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostStore on _PostStore, Store {
  final _$postsFutureAtom = Atom(name: '_PostStore.postsFuture');

  @override
  ObservableFuture<List<PostModel>> get postsFuture {
    _$postsFutureAtom.context.enforceReadPolicy(_$postsFutureAtom);
    _$postsFutureAtom.reportObserved();
    return super.postsFuture;
  }

  @override
  set postsFuture(ObservableFuture<List<PostModel>> value) {
    _$postsFutureAtom.context.conditionallyRunInAction(() {
      super.postsFuture = value;
      _$postsFutureAtom.reportChanged();
    }, _$postsFutureAtom, name: '${_$postsFutureAtom.name}_set');
  }

  final _$postStateFutureAtom = Atom(name: '_PostStore.postStateFuture');

  @override
  ObservableFuture<PostModel> get postStateFuture {
    _$postStateFutureAtom.context.enforceReadPolicy(_$postStateFutureAtom);
    _$postStateFutureAtom.reportObserved();
    return super.postStateFuture;
  }

  @override
  set postStateFuture(ObservableFuture<PostModel> value) {
    _$postStateFutureAtom.context.conditionallyRunInAction(() {
      super.postStateFuture = value;
      _$postStateFutureAtom.reportChanged();
    }, _$postStateFutureAtom, name: '${_$postStateFutureAtom.name}_set');
  }

  final _$getAllPostsAsyncAction = AsyncAction('getAllPosts');

  @override
  Future<void> getAllPosts() {
    return _$getAllPostsAsyncAction.run(() => super.getAllPosts());
  }

  final _$deletePostAsyncAction = AsyncAction('deletePost');

  @override
  Future<void> deletePost(String postId) {
    return _$deletePostAsyncAction.run(() => super.deletePost(postId));
  }

  final _$editPostAsyncAction = AsyncAction('editPost');

  @override
  Future<void> editPost(PostModel postModel) {
    return _$editPostAsyncAction.run(() => super.editPost(postModel));
  }

  final _$createPostAsyncAction = AsyncAction('createPost');

  @override
  Future<PostModel> createPost(String content) {
    return _$createPostAsyncAction.run(() => super.createPost(content));
  }

  final _$_PostStoreActionController = ActionController(name: '_PostStore');

  @override
  void clearState() {
    final _$actionInfo = _$_PostStoreActionController.startAction();
    try {
      return super.clearState();
    } finally {
      _$_PostStoreActionController.endAction(_$actionInfo);
    }
  }
}
