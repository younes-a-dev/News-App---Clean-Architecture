part of 'home_bloc.dart';

class HomeState {
  ArticleStatus articleStatus;

  HomeState({required this.articleStatus});

  HomeState copyWith({ArticleStatus? newArticleStatus}) {
    return HomeState(articleStatus: newArticleStatus ?? articleStatus);
  }
}
