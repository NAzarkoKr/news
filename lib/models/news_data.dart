import 'package:news_api/models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=ua&apiKey=4418dc4388c44e63ae27ea85c088abe7';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            imgUrl: element['urlToImage'],
            description: element['description'],
            articleUrl: element['url'],
            content: element['content'],
          );

          news.add(article);
        }
      });
    }
  }
}
