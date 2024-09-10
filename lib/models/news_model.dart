class NewsModel {
  final String? image;
  final String title;
  final String? desc;
  final String articleUrl;

  NewsModel(
      {required this.articleUrl,
      required this.image,
      required this.title,
      required this.desc});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        image: json['image'],
        title: json['title'],
        desc: json['description'],
        articleUrl: json['url']);
  }
}
