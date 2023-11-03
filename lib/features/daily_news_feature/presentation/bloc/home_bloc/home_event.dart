part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetArticlesEvent extends HomeEvent {
  GetArticlesEvent();
}
