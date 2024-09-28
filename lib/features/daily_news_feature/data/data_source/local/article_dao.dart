import 'package:floor/floor.dart';

import '../../models/article_model.dart';
@dao
abstract class ArticleDao{
  @Query('SELECT * FROM articles')
  Future<List<ArticleModel>> getArticles();

  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);
}