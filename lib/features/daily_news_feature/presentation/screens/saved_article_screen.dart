import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/daily_news_feature/domain/entities/article_entity.dart';
import 'package:news/features/daily_news_feature/presentation/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:news/features/daily_news_feature/presentation/bloc/bookmark_bloc/get_saved_articles_status.dart';
import 'package:news/features/daily_news_feature/presentation/screens/article_detail_screen.dart';
import 'package:news/features/daily_news_feature/presentation/widgets/article_widget.dart';

import '../../../../locator.dart';

class SavedArticleScreen extends StatefulWidget {
  static const routeName = '/Saved Article Screen';

  const SavedArticleScreen({Key? key}) : super(key: key);

  @override
  State<SavedArticleScreen> createState() => _SavedArticleScreenState();
}

class _SavedArticleScreenState extends State<SavedArticleScreen> {


  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookmarkBloc>(context).add(GetSavedArticlesEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved Articles',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BlocBuilder<BookmarkBloc, BookmarkState>(
        builder: (context, state) {
          if (state.getSavedArticlesStatus is GetSavedArticlesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.getSavedArticlesStatus is GetSavedArticlesCompleted) {
            GetSavedArticlesCompleted getSavedArticlesCompleted = state.getSavedArticlesStatus as GetSavedArticlesCompleted;
            List<ArticleEntity> articles = getSavedArticlesCompleted.articles;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, i) {
                return ArticleWidget(
                  article: articles[i],
                  isRemovable: true,
                  onRemove: (article) {
                    BlocProvider.of<BookmarkBloc>(context).add(DeleteArticleEvent(article));
                    BlocProvider.of<BookmarkBloc>(context).add(GetSavedArticlesEvent());
                  },
                  onArticlePressed: (articles) => Navigator.of(context).pushNamed(ArticleDetailScreen.routeNamed,arguments: articles),
                );
              },
            );
          } else if (state.getSavedArticlesStatus is GetSavedArticlesError) {
            return const Center(child: Text('Something went wrong...'));
          }
          return Container();
        },
      ),
    );
  }
}
