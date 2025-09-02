import 'package:news_app/data/models/article_model.dart';

abstract class TrendingNewsState {}

class TrendingNewsInitialState extends TrendingNewsState {}

class TrendingNewsLoadingState extends TrendingNewsState {}

class TrendingNewsLoadedState extends TrendingNewsState {
  List<ArticleModel> allArticle = [];
  TrendingNewsLoadedState({required this.allArticle});
}

class TrendingNewsErrorState extends TrendingNewsState {
  String errorMessage;
  TrendingNewsErrorState({required this.errorMessage});
}
