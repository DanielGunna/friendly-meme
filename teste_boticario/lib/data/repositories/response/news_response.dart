import 'package:teste_boticario/data/repositories/response/message_response.dart';
import 'package:teste_boticario/data/repositories/response/user_reponse.dart';

class NewsResponse {
  UserResponse user;
  MessageResponse message;

  NewsResponse({this.user, this.message});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    user =
        json['user'] != null ? new UserResponse.fromJson(json['user']) : null;
    message = json['message'] != null
        ? new MessageResponse.fromJson(json['message'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.message != null) {
      data['message'] = this.message.toJson();
    }
    return data;
  }
}
