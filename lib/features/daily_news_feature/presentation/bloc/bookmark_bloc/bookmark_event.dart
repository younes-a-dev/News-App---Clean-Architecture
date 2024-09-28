part of 'bookmark_bloc.dart';

@immutable
abstract class BookmarkEvent {}


class GetSavedArticlesEvent extends BookmarkEvent{}

class SaveArticleEvent extends BookmarkEvent{
  final ArticleEntity article;
  SaveArticleEvent(this.article);
}

class DeleteArticleEvent extends BookmarkEvent{
  final ArticleEntity article;
  DeleteArticleEvent(this.article);
}
