import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/logic/blocs/trending_news/trending_news_bloc.dart';
import 'package:news_app/logic/blocs/trending_news/trending_news_event.dart';
import 'package:news_app/logic/blocs/trending_news/trending_news_state.dart';

class TrendingNews extends StatefulWidget {
  final String searchKeyword;
  const TrendingNews({super.key, required this.searchKeyword});
  @override
  State<TrendingNews> createState() => _TrendingNewsState();
}

class _TrendingNewsState extends State<TrendingNews> {
  @override
  void initState() {
    super.initState();
    context.read<TrendingNewsBloc>().add(
      GetAllTrendingNewsEvent(searchKeyword: widget.searchKeyword),
    );
  }

  @override
  void didUpdateWidget(covariant TrendingNews oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.searchKeyword != oldWidget.searchKeyword) {
      //print('Keyword changed: ${widget.searchKeyword}');
      context.read<TrendingNewsBloc>().add(
        GetAllTrendingNewsEvent(searchKeyword: widget.searchKeyword),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingNewsBloc, TrendingNewsState>(
      builder: (context, state) {
        if (state is TrendingNewsLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is TrendingNewsErrorState) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is TrendingNewsLoadedState) {
          return state.allArticle.isNotEmpty
              ? ListView.builder(
                  itemCount: state.allArticle.length,
                  itemBuilder: (BuildContext context, int index) {
                    ArticleModel article = state.allArticle[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: ListTile(
                        leading: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(12),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            article.urlToImage ??
                                'https://via.placeholder.com/150',
                            height: 300,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          article.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 11),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              article.author ?? 'Unknown',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.pink,
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.mode_comment_outlined,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(child: Text('No Breaking News'));
        }
        return SizedBox();
      },
    );
  }
}
