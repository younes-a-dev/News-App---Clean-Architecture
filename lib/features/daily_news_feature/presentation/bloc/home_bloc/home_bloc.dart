import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/core/usecase/usecase.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/usecases/get_articles_usecase.dart';
import 'article_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetArticlesUseCase _getArticleUseCase;

  HomeBloc(this._getArticleUseCase) : super(HomeState(articleStatus: GetArticleLoading())) {
    on<GetArticlesEvent>((event, emit)async {
      emit(state.copyWith(newArticleStatus: GetArticleLoading()));

      DataState dataState = await _getArticleUseCase.call(NoParams());

      if(dataState is DataSuccess){
        print('1');
        emit(state.copyWith(newArticleStatus: GetArticleCompleted(dataState.data)));
      }

      if(dataState is DataFailed){
        print('2');
        emit(state.copyWith(newArticleStatus: GetArticleError(dataState.error!)));
      }
    });
  }
}
