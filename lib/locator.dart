import 'package:get_it/get_it.dart';
import 'package:news/features/daily_news_feature/data/data_source/remote/news_api_provider.dart';
import 'package:news/features/daily_news_feature/data/repository/article_repository_impl.dart';
import 'package:news/features/daily_news_feature/domain/usecases/get_articles_usecase.dart';
import 'package:news/features/daily_news_feature/presentation/bloc/home_bloc/home_bloc.dart';

import 'features/daily_news_feature/domain/repository/article_repository.dart';


GetIt locator = GetIt.instance;

setup(){
  locator.registerSingleton<NewsApiProvider>(NewsApiProvider());

  // repositories
  locator.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(locator()));


  // usecases
  locator.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(locator()));

  // Bloc
  locator.registerSingleton<HomeBloc>(HomeBloc(locator()));
}