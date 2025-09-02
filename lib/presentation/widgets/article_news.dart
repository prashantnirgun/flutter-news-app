import 'package:flutter/material.dart';
import 'package:news_app/data/models/article_model.dart';

class ArticleNews extends StatefulWidget {
  final ArticleModel article;
  const ArticleNews({super.key, required this.article});

  @override
  State<ArticleNews> createState() => _ArticleNewsState();
}

class _ArticleNewsState extends State<ArticleNews> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.article.urlToImage ??
                      'https://via.placeholder.com/150',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
              color: Colors.grey.shade400,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    widget.article.title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.article.description ?? '',
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.favorite_border_outlined, color: Colors.black),
                      SizedBox(width: 5),
                      Icon(Icons.mode_comment_outlined, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
