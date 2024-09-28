import 'package:equatable/equatable.dart';

import '../../../data/models/article_model.dart';

abstract class SaveArticleStatus extends Equatable{}

// Init
class SaveArticleInitial extends SaveArticleStatus{
  @override
  List<Object?> get props => [];
}


// Loading
class SaveArticleLoading extends SaveArticleStatus{
  @override
  List<Object?> get props => [];
}

// Completed
class SaveArticleCompleted extends SaveArticleStatus{
  final ArticleModel article;
  SaveArticleCompleted(this.article);

  @override
  List<Object?> get props => [article];
}


class SaveArticleError extends SaveArticleStatus{
  final String? message;
  SaveArticleError(this.message);

  @override
  List<Object?> get props => [message];


}