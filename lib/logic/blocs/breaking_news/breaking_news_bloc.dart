import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants/api_constants.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/logic/blocs/breaking_news/breaking_news_event.dart';
import 'package:news_app/logic/blocs/breaking_news/breaking_news_state.dart';
import 'package:news_app/services/api/api_helper.dart';

class BreakingNewsBloc extends Bloc<BreakingNewsEvent, BreakingNewsState> {
  ApiHelper apiHelper;
  BreakingNewsBloc({required this.apiHelper})
    : super(BreakingNewsInitalState()) {
    on<GetAllBreakingNewsEvent>(breakingNewsFetchEvent);
  }

  FutureOr<void> breakingNewsFetchEvent(
    GetAllBreakingNewsEvent event,
    Emitter<BreakingNewsState> emit,
  ) async {
    emit(BreakingNewsInitalState());
    try {
      //fetch
      dynamic mData = await apiHelper.getApi(url: ApiConstants.topHeadlineUrl);

      //mapper
      ArticlDataModel articlDataModel = ArticlDataModel.fromJson(mData);

      //emit
      emit(BreakingNewsLoadedState(allArticle: articlDataModel.articles));
    } catch (e) {
      emit(BreakingNewsErrorState(errorMessage: e.toString()));
    }
  }
}
