import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app_ui_setup/models/news_model.dart';

class NewsServices {
  final Dio dio = Dio();

// async methods allow the use of await keyword
//await keyword makes the program wait until the waited line finishes loading
  Future<List<NewsModel>?> getNews({required String category}) async {
    try {
      String? apiKey = dotenv.env['API_KEY'];
      Response response = await dio.get(
          'https://api.mediastack.com/v1/news?access_key=$apiKey&languages=en&categories=$category&limit=100&sources=cnn,bbc');
      Map<String, dynamic> jsonData = response.data;
      // int totalResults = jsonData['totalResults'];
      // if (totalResults == 0) return null;

      List<dynamic> articles = jsonData['data'];
      List<NewsModel> articleList = [];

      for (var article in articles) {
        if (article['title'] == '[Removed]') continue;
        NewsModel news = NewsModel.fromJson(article);
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
