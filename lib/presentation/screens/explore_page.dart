import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/logic/blocs/trending_news/trending_news_bloc.dart';
import 'package:news_app/logic/blocs/trending_news/trending_news_event.dart';
import 'package:news_app/logic/blocs/trending_news/trending_news_state.dart';
import 'package:news_app/presentation/widgets/article_news.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              controller: searchController,
              leading: Icon(Icons.search),
              trailing: [
                //if (searchController.text.isNotEmpty)
                IconButton(
                  onPressed: () {
                    context.read<TrendingNewsBloc>().add(
                      GetAllTrendingNewsEvent(
                        searchKeyword: searchController.text,
                      ),
                    );
                    searchController.clear();
                  },
                  icon: Icon(Icons.travel_explore),
                ),
              ],
              onChanged: (value) {},
            ),
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: 'Read More '),
                  TextSpan(
                    text: 'News ',
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextSpan(text: 'And See What Happened On '),
                  TextSpan(
                    text: 'Another World',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<TrendingNewsBloc, TrendingNewsState>(
                builder: (context, state) {
                  if (state is TrendingNewsLoadingState) {
                    return Center(child: CircleAvatar());
                  }

                  if (state is TrendingNewsErrorState) {
                    return Center(child: Text(state.errorMessage));
                  }

                  if (state is TrendingNewsLoadedState) {
                    state.allArticle.isNotEmpty
                        ? ListView.builder(
                            itemCount: state.allArticle.length,
                            itemBuilder: (BuildContext context, int index) {
                              ArticleModel article = state.allArticle[index];
                              //print('list builder => $article');
                              return ArticleNews(article: article);
                            },
                          )
                        : Center(child: Text('No data found'));
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
