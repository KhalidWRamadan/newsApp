import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/news_model.dart';

class NewsServices {
  final Dio dio = Dio();

// async methods allow the use of await keyword
//await keyword makes the program wait until the waited line finishes loading
  Future<List<NewsModel>?> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=3c077f55401d45f196e44d297bdfb1cd&category=$category');
      Map<String, dynamic> jsonData = response.data;
      int totalResults = jsonData['totalResults'];
      if (totalResults == 0) return null;
      List<dynamic> articles = jsonData['articles'];
      List<NewsModel> articleList = [];
      for (var article in articles) {
        if (article['title'] == '[Removed]') continue;
        NewsModel news = NewsModel(
            image: article['urlToImage'],
            title: article['title'],
            desc: article['description']);
        articleList.add(news);
      }
      return articleList;
    } catch (e) {
      return null;
    }
  }

  // String imageValidator(String image) {
  //   try {
  //     article['image_url'];
  //   } catch (e) {}
  // }
}
