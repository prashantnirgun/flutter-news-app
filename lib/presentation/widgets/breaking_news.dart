import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/logic/blocs/breaking_news/breaking_news_bloc.dart';
import 'package:news_app/logic/blocs/breaking_news/breaking_news_event.dart';

import 'package:news_app/logic/blocs/breaking_news/breaking_news_state.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  @override
  void initState() {
    super.initState();
    context.read<BreakingNewsBloc>().add(GetAllBreakingNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreakingNewsBloc, BreakingNewsState>(
      builder: (context, state) {
        if (state is BreakingNewsLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is BreakingNewsErrorState) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is BreakingNewsLoadedState) {
          return state.allArticle.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.allArticle.length,
                  itemBuilder: (BuildContext context, int index) {
                    ArticleModel article = state.allArticle[index];

                    return Card(
                      child: Container(
                        width: 350,
                        padding: EdgeInsets.only(
                          bottom: 10,
                          left: 10,
                          right: 10,
                        ),
                        //color: Colors.blue,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              article.urlToImage ??
                                  'https://via.placeholder.com/150',
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          //border: BoxBorder.all(color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey, // 👈 single solid shadow color
                              blurRadius: 8, // softness
                              offset: Offset(4, 4), // position (x, y)
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade600,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                article.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              ),
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
