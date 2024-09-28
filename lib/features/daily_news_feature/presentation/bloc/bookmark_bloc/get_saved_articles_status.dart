import 'package:equatable/equatable.dart';

import '../../../data/models/article_model.dart';

abstract class GetSavedArticlesStatus extends Equatable {}


// Loading state
class GetSavedArticlesLoading extends GetSavedArticlesStatus {
  @override
  List<Object?> get props => [];
}


// Completed state
class GetSavedArticlesCompleted extends GetSavedArticlesStatus{
  final List<ArticleModel> articles;
  GetSavedArticlesCompleted(this.articles);

  @override

  List<Object?> get props => [articles];
}


// Error state
class GetSavedArticlesError extends GetSavedArticlesStatus{
  final String? message;
  GetSavedArticlesError(this.message);

  @override
  List<Object?> get props => [message];

}