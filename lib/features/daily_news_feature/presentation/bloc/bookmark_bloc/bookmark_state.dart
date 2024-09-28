part of 'bookmark_bloc.dart';

class BookmarkState extends Equatable {
  final GetSavedArticlesStatus getSavedArticlesStatus;
  final SaveArticleStatus saveArticleStatus;
  final DeleteArticleStatus deleteArticleStatus;

  const BookmarkState({required this.getSavedArticlesStatus, required this.saveArticleStatus, required this.deleteArticleStatus});

  BookmarkState copyWith(
      {GetSavedArticlesStatus? newGetArticleStatus, SaveArticleStatus? newSaveArticleStatus, DeleteArticleStatus? newDeleteArticleStatus}) {
    return BookmarkState(
      getSavedArticlesStatus: newGetArticleStatus ?? getSavedArticlesStatus,
      saveArticleStatus: newSaveArticleStatus ?? saveArticleStatus,
      deleteArticleStatus: newDeleteArticleStatus ?? deleteArticleStatus,
    );
  }

  @override
  List<Object> get props => [
        getSavedArticlesStatus,
        saveArticleStatus,
        deleteArticleStatus,
      ];
}
