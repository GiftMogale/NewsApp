import 'dart:convert';
import 'package:google_signin/model/article_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Article>> getArticle() async {
    Response res = await http
        .get(Uri.parse("https://www.livenewstoday.app/wp-json/wp/v2/posts"));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
