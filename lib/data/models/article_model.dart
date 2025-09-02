class SourceModel {
  String? id;
  String name;

  SourceModel({this.id, required this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json['id'], name: json['name']);
  }
}

class ArticleModel {
  SourceModel source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  String publishedAt;
  String? content;

  ArticleModel({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: SourceModel.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}

class ArticlDataModel {
  String status;
  int totalResults;
  List<ArticleModel> articles;
  ArticlDataModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ArticlDataModel.fromJson(Map<String, dynamic> json) {
    List<ArticleModel> articles = [];
    for (Map<String, dynamic> article in json['articles']) {
      articles.add(ArticleModel.fromJson(article));
    }
    return ArticlDataModel(
      articles: articles,
      status: json['status'],
      totalResults: json['totalResults'],
    );
  }
}
