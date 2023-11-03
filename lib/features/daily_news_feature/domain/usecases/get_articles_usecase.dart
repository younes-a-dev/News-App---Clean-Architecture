import 'package:news/core/usecase/usecase.dart';
import 'package:news/features/daily_news_feature/domain/entities/article_entity.dart';
import 'package:news/features/daily_news_feature/domain/repository/article_repository.dart';

import '../../../../core/resources/data_state.dart';

class GetArticlesUseCase implements UseCase<DataState<List<ArticleEntity>>, NoParams> {
  final ArticleRepository _articleRepository;

  GetArticlesUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call(NoParams params) {
    return _articleRepository.getNewsArticles();
  }
}
