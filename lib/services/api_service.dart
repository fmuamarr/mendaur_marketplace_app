//HTTP request service
//from API get article dikembalikan ke dalam list Articles

import 'dart:convert';

import 'package:http/http.dart';

import '../model/article_model.dart';

class ApiService {
  //menambahkan Endpoint URL,

  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=id&apiKey=635c44f3988f445caafbeb76ea9a36cb";

  //import http package

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the articles");
    }
  }
}
