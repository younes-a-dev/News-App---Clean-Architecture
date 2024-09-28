import 'package:equatable/equatable.dart';
import 'package:news/features/daily_news_feature/domain/entities/article_entity.dart';

abstract class DeleteArticleStatus extends Equatable{}


// Loading state
class DeleteArticleLoading extends DeleteArticleStatus{
  @override
  List<Object?> get props => [];
}

// Completed state
class DeleteArticleCompleted extends DeleteArticleStatus{
  final ArticleEntity article;
  DeleteArticleCompleted(this.article);
  @override
  List<Object?> get props => [article];
}

// Error state
class DeleteArticleError extends DeleteArticleStatus{
  final String? message;
  DeleteArticleError(this.message);
  @override
  List<Object?> get props =>[message];

}