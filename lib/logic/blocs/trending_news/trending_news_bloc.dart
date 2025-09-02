import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/api_constants.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/logic/blocs/trending_news/trending_news_event.dart';
import 'package:news_app/logic/blocs/trending_news/trending_news_state.dart';
import 'package:news_app/services/api/api_helper.dart';

class TrendingNewsBloc extends Bloc<TrendingNewsEvent, TrendingNewsState> {
  ApiHelper apiHelper;
  TrendingNewsBloc({required this.apiHelper})
    : super(TrendingNewsInitialState()) {
    on<GetAllTrendingNewsEvent>(getAllTrendingNewsEvent);
  }

  FutureOr<void> getAllTrendingNewsEvent(
    GetAllTrendingNewsEvent event,
    Emitter<TrendingNewsState> emit,
  ) async {
    emit(TrendingNewsInitialState());
    try {
      //fetch
      final String url = '${ApiConstants.articleUrl}?q=${event.searchKeyword}';
      dynamic mData = await apiHelper.getApi(url: url);
      //mapper
      ArticlDataModel articlDataModel = ArticlDataModel.fromJson(mData);
      //print('data => ${articlDataModel.articles}');
      //emit
      emit(TrendingNewsLoadedState(allArticle: articlDataModel.articles));
    } catch (e) {
      emit(TrendingNewsErrorState(errorMessage: e.toString()));
    }
  }
}
