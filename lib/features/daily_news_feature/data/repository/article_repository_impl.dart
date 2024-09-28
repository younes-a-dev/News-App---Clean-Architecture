import 'package:dio/dio.dart';
import 'package:news/core/resources/data_state.dart';
import 'package:news/features/daily_news_feature/data/data_source/remote/news_api_provider.dart';

import 'package:news/features/daily_news_feature/domain/entities/article_entity.dart';

import '../../domain/repository/article_repository.dart';
import '../data_source/local/article_dao.dart';
import '../models/article_model.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiProvider _newsApiProvider;
  ArticleDao articleDao;

  ArticleRepositoryImpl(this._newsApiProvider, this.articleDao);


  // Get Articles (API)
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      Response response = await _newsApiProvider.getNews();
      if (response.statusCode == 200) {
        List<dynamic> art = response.data['articles'];
        List<ArticleEntity> articles = [];
        for (var element in art) {
          articles.add(ArticleModel.fromJson(element));
        }
        print(articles);
        return DataSuccess(articles);
      } else {
        return const DataFailed('Something went Wrong...');
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }


  // Delete article from db
  @override
  Future<DataState<ArticleEntity>> deleteArticle(ArticleEntity article) async{
    try{
      await articleDao.deleteArticle(ArticleModel.fromEntity(article));
      return DataSuccess(article);
    }catch(e){
      return DataFailed(e.toString());
    }
  }

  // Get saved Articles from db
  @override
  Future<DataState<List<ArticleEntity>>> getSavedArticle() async{
   try{
     List<ArticleEntity> articles = await articleDao.getArticles();
     return DataSuccess(articles);
   }catch(e){
     return DataFailed(e.toString());
   }
  }

  // Save Article to db
  @override
  Future<DataState<ArticleEntity>> saveArticle(ArticleEntity article) async {
    try {
      ArticleModel art = ArticleModel(
        title: article.title,
        description: article.description,
        author: article.author,
        publishedAt: article.publishedAt,
        urlToImage: article.urlToImage,
        url: article.url,
        content: article.content,
      );
      await articleDao.insertArticle(art);
      return DataSuccess(art);

    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
