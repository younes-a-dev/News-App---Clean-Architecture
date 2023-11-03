import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/article_entity.dart';

@immutable
abstract class ArticleStatus extends Equatable {}

// Loading
class GetArticleLoading extends ArticleStatus {
  @override
  List<Object?> get props => [];
}



// Completed
class GetArticleCompleted extends ArticleStatus {
  final List<ArticleEntity> articles;

  GetArticleCompleted(this.articles);

  @override
  List<Object?> get props => [articles];
}




//Error
class GetArticleError extends ArticleStatus {
  final String message;

  GetArticleError(this.message);

  @override
  List<Object?> get props => [message];
}
