import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/config/theme/app_theme.dart';
import 'package:news/features/daily_news_feature/presentation/screens/article_detail_screen.dart';

import 'features/daily_news_feature/presentation/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'features/daily_news_feature/presentation/bloc/home_bloc/home_bloc.dart';
import 'features/daily_news_feature/presentation/screens/home_screen.dart';
import 'features/daily_news_feature/presentation/screens/saved_article_screen.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init locator
  await setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => locator<HomeBloc>()),
          BlocProvider(create: (context) => locator<BookmarkBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          title: 'News App',
          home: const HomeScreen(),
          routes: {
            ArticleDetailScreen.routeNamed: (ctx) => ArticleDetailScreen(),
            SavedArticleScreen.routeName: (ctx) => SavedArticleScreen(),
          },
        ));
  }
}
