import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/daily_news_feature/domain/entities/article_entity.dart';
import 'package:news/features/daily_news_feature/presentation/bloc/home_bloc/article_status.dart';
import 'package:news/features/daily_news_feature/presentation/screens/saved_article_screen.dart';
import 'package:news/features/daily_news_feature/presentation/widgets/article_widget.dart';

import '../bloc/home_bloc/home_bloc.dart';
import 'article_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily News',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SavedArticleScreen.routeName);
              },
              icon: const Icon(
                Icons.bookmark_border_rounded,
                color: Colors.black,
              )),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.articleStatus is GetArticleLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.black,strokeWidth: 1,));
          }
          if (state.articleStatus is GetArticleCompleted) {
            final GetArticleCompleted getArticleCompleted = state.articleStatus as GetArticleCompleted;
            final List<ArticleEntity> articles = getArticleCompleted.articles;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (_, i) {
                return ArticleWidget(
                  article: articles[i],
                  onArticlePressed: (article){
                    Navigator.of(context).pushNamed(ArticleDetailScreen.routeNamed,arguments: article);
                  },
                );
              },
            );
          }
          if (state.articleStatus is GetArticleError) {
            return const Center(child: Text('Error'));
          }
          return Container();
        },
      ),
    );
  }
}
