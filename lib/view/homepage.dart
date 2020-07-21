import 'package:flutter/material.dart';
import 'package:news_api/models/news_data.dart';
import 'package:news_api/widgets/newstile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading;
  var newsList;
  void getNews() async {
    News news = News();
    await news.getNews();
    newsList = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter News', style: TextStyle(color: Colors.blue)),
        elevation: 0.0,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return NewsTile(
                    articleUrl: newsList[index].articleUrl,
                    title: newsList[index].title,
                    subtitle: newsList[index].description,
                    imgUrl: newsList[index].imgUrl,
                  );
                },
              ),
            ),
    );
  }
}
