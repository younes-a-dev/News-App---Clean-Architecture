import '../../../../core/resources/data_state.dart';
import '../../data/models/article_model.dart';
import '../entities/article_entity.dart';

abstract class ArticleRepository{

 // Api
 Future<DataState<List<ArticleEntity>>> getNewsArticles();

 // Database
 Future<DataState<List<ArticleEntity>>> getSavedArticle();
 Future<DataState<ArticleEntity>> deleteArticle(ArticleEntity article);
 Future<DataState<ArticleEntity>> saveArticle(ArticleEntity article);
}