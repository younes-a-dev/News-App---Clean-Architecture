import 'package:dio/dio.dart';
import 'package:news/core/resources/data_state.dart';
import 'package:news/features/daily_news_feature/data/data_source/remote/news_api_provider.dart';

import 'package:news/features/daily_news_feature/domain/entities/article_entity.dart';

import '../../domain/repository/article_repository.dart';
import '../models/article_model.dart';

class ArticleRepositoryImpl extends ArticleRepository{
  final NewsApiProvider _newsApiProvider;
  
  ArticleRepositoryImpl(this._newsApiProvider);
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async{
    try{
      Response response = await _newsApiProvider.getNews();
      if(response.statusCode == 200){
        List<dynamic> art = response.data['articles'];
        List<ArticleEntity> articles = [];
        for (var element in art) {
          articles.add(ArticleModel.fromJson(element));
        }
        print(articles);
        return DataSuccess(articles);
      }else{
        return const DataFailed('Something went Wrong...');
      }
    }catch(e){
      return DataFailed(e.toString());
    }
  }

}