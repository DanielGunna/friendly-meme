class UserEntity {
  int id;
  String name;
  String email;
  String password;

  UserEntity({this.name, this.password, this.email});

  UserEntity.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    password = map['password'];
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email, 'password': password};
  }
}
