import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../locator.dart';
import '../../data/models/article_model.dart';
import '../../domain/entities/article_entity.dart';
import '../bloc/bookmark_bloc/bookmark_bloc.dart';

class ArticleDetailScreen extends StatelessWidget {
  static const routeNamed = '/Article Detail Screen';

  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final article = ModalRoute.of(context)!.settings.arguments as ArticleModel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '${article.title}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time,
                  color: Colors.grey,
                  size: 16,
                ),
                Text(
                  '${article.publishedAt}',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: size.height / 3.5,
            child: Image.network(
              '${article.urlToImage}',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              '${article.description}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              '${article.content}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<BookmarkBloc>(context).add(SaveArticleEvent(article));
        },
         backgroundColor: Colors.white,
         foregroundColor: Colors.black,
        child: const Icon(Icons.bookmark_border_rounded),
      ),
    );
  }
}
