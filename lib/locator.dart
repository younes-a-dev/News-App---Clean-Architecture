import 'package:get_it/get_it.dart';
import 'package:news/features/daily_news_feature/data/data_source/local/app_database.dart';
import 'package:news/features/daily_news_feature/data/data_source/remote/news_api_provider.dart';
import 'package:news/features/daily_news_feature/data/repository/article_repository_impl.dart';
import 'package:news/features/daily_news_feature/domain/usecases/delete_article_usecase.dart';
import 'package:news/features/daily_news_feature/domain/usecases/get_articles_usecase.dart';
import 'package:news/features/daily_news_feature/domain/usecases/get_saved_articles_usecase.dart';
import 'package:news/features/daily_news_feature/domain/usecases/save_article_usecase.dart';
import 'package:news/features/daily_news_feature/presentation/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:news/features/daily_news_feature/presentation/bloc/home_bloc/home_bloc.dart';

import 'features/daily_news_feature/domain/repository/article_repository.dart';


GetIt locator = GetIt.instance;

setup() async {
  locator.registerSingleton<NewsApiProvider>(NewsApiProvider());

  // Database
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(database);

  // repositories
  locator.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(locator(),database.articleDAO));


  // UseCase
  locator.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(locator()));
  locator.registerSingleton<DeleteArticleUseCase>(DeleteArticleUseCase(locator()));
  locator.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(locator()));
  locator.registerSingleton<GetSavedArticlesUseCase>(GetSavedArticlesUseCase(locator()));

  // Bloc
  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));
  locator.registerSingleton<BookmarkBloc>(BookmarkBloc(locator(), locator(), locator()));
}