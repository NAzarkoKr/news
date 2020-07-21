import 'package:flutter/material.dart';
import 'package:news_api/view/article_view.dart';

class NewsTile extends StatelessWidget {
  final String title, imgUrl, subtitle, articleUrl;
  NewsTile({this.title, this.subtitle, this.imgUrl, this.articleUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleDetail(
                      postUrl: articleUrl,
                    )));
      },
      child: Container(
        child: ListTile(
          title: Text(
            title ?? 'default value',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle ?? 'default value',
            maxLines: 2,
          ),
          leading: ClipRRect(
              child: Image.network(
                  imgUrl ??
                      'https://img.favpng.com/1/5/7/computer-icons-symbol-exception-handling-png-favpng-3Esx4cisLwtPKg3b2xppYkkKe.jpg',
                  width: 60,
                  height: 90,
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
