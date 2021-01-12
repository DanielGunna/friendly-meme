class PostEntity {
  int id;
  String content;
  String createdAt;
  int userId;

  PostEntity({this.id, this.content, this.userId, this.createdAt});

  PostEntity.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    content = map['content'];
    createdAt = map['created_at'];
    userId = map['user_id'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'user_id': userId,
    };
  }
}
