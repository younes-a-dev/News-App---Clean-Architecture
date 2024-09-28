import 'package:news/core/resources/data_state.dart';
import 'package:news/core/usecase/usecase.dart';
import 'package:news/features/daily_news_feature/domain/entities/article_entity.dart';
import 'package:news/features/daily_news_feature/domain/repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<DataState<ArticleEntity>,ArticleEntity>{
  final ArticleRepository _articleRepository;
  SaveArticleUseCase(this._articleRepository);

  @override
  Future<DataState<ArticleEntity>> call(ArticleEntity article) {
    return _articleRepository.saveArticle(article);
  }


}