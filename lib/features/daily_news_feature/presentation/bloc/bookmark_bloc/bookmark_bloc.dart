import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news/core/resources/data_state.dart';
import 'package:news/core/usecase/usecase.dart';
import 'package:news/features/daily_news_feature/presentation/bloc/bookmark_bloc/delete_article_status.dart';
import 'package:news/features/daily_news_feature/presentation/bloc/bookmark_bloc/save_article_status.dart';

import '../../../domain/entities/article_entity.dart';
import '../../../domain/usecases/delete_article_usecase.dart';
import '../../../domain/usecases/get_saved_articles_usecase.dart';
import '../../../domain/usecases/save_article_usecase.dart';
import '../home_bloc/home_bloc.dart';
import 'get_saved_articles_status.dart';

part 'bookmark_event.dart';

part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  GetSavedArticlesUseCase getSavedArticlesUseCase;
  SaveArticleUseCase saveArticleUseCase;
  DeleteArticleUseCase deleteArticleUseCase;

  BookmarkBloc(this.getSavedArticlesUseCase,this.saveArticleUseCase,this.deleteArticleUseCase)
      : super(BookmarkState(
          getSavedArticlesStatus: GetSavedArticlesLoading(),
          saveArticleStatus: SaveArticleInitial(),
          deleteArticleStatus: DeleteArticleLoading(),
        )) {

    // get Saved Articles from db event
    on<GetSavedArticlesEvent>((event, emit) async{

      // emit loading state
      emit(state.copyWith(newGetArticleStatus: GetSavedArticlesLoading()));

      DataState dataState = await getSavedArticlesUseCase(NoParams());

      // emit complete state
      if(dataState is DataSuccess){
        emit(state.copyWith(newGetArticleStatus: GetSavedArticlesCompleted(dataState.data)));
      }

      // emit error state
      if(dataState is DataFailed){
        emit(state.copyWith(newGetArticleStatus: GetSavedArticlesError(dataState.error)));
      }
    });


    // Save article to db event
    on<SaveArticleEvent>((event,emit) async{
      // emit loading state
      emit(state.copyWith(newSaveArticleStatus: SaveArticleLoading()));

      DataState dataState = await saveArticleUseCase(event.article);

      // emit complete state
      if(dataState is DataSuccess){
        emit(state.copyWith(newSaveArticleStatus: SaveArticleCompleted(dataState.data)));
      }

      // emit error state
      if(dataState is DataFailed){
        emit(state.copyWith(newSaveArticleStatus: SaveArticleError(dataState.error)));
      }
    });


    // delete article from db event
    on<DeleteArticleEvent>((event,emit) async{
      // emit loading state
      emit(state.copyWith(newDeleteArticleStatus: DeleteArticleLoading()));

      DataState dataState = await deleteArticleUseCase(event.article);

      // emit complete state
      if(dataState is DataSuccess){
        emit(state.copyWith(newDeleteArticleStatus: DeleteArticleCompleted(dataState.data)));
        print('rm:success');
      }

      // emit error state
      if(dataState is DataFailed){
        emit(state.copyWith(newDeleteArticleStatus: DeleteArticleError(dataState.error)));
        print('rm:failed');
      }
    });
  }
}
