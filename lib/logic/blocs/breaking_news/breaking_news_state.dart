import 'package:news_app/data/models/article_model.dart';

abstract class BreakingNewsState {}

class BreakingNewsInitalState extends BreakingNewsState {}

class BreakingNewsLoadingState extends BreakingNewsState {}

class BreakingNewsLoadedState extends BreakingNewsState {
  List<ArticleModel> allArticle;
  BreakingNewsLoadedState({required this.allArticle});
}

class BreakingNewsErrorState extends BreakingNewsState {
  String errorMessage;
  BreakingNewsErrorState({required this.errorMessage});
}
