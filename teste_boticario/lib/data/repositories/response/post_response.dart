import 'package:teste_boticario/data/repositories/response/news_response.dart';

class PostResponse {
  List<NewsResponse> news;

  PostResponse({this.news});

  PostResponse.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = new List<NewsResponse>();
      json['news'].forEach((v) {
        news.add(new NewsResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
