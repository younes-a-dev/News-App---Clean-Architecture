import 'package:news/core/resources/data_state.dart';
import 'package:news/core/usecase/usecase.dart';
import 'package:news/features/daily_news_feature/domain/entities/article_entity.dart';
import 'package:news/features/daily_news_feature/domain/repository/article_repository.dart';

import '../../data/models/article_model.dart';

class GetSavedArticlesUseCase implements UseCase<DataState<List<ArticleEntity>>,NoParams>{
  final ArticleRepository _articleRepository;
  GetSavedArticlesUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call(NoParams params) {
    return _articleRepository.getSavedArticle();
  }

}