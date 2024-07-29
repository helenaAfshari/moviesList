part of 'get_movies_list_bloc.dart';

abstract class GetMoviesListEvent {}

class GetMoviesStart extends GetMoviesListEvent{}
class InisialEvent extends GetMoviesStart{}
class LoadedEvent extends GetMoviesStart{}



class SearchBarEvent extends GetMoviesListEvent{
  final String? searchKeyWord;
  SearchBarEvent(this.searchKeyWord);
}

