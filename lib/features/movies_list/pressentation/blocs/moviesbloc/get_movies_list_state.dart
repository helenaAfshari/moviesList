part of 'get_movies_list_bloc.dart';

abstract class GetMoviesListState {}

class InitialGetMoviesList extends GetMoviesListState {}

class LoadedGetMoviesList extends GetMoviesListState {
  final List<GetMoviesListEntity> movies;
  LoadedGetMoviesList(this.movies);
}

class ErrorGetMoviesList extends GetMoviesListState {
  final String message;
  ErrorGetMoviesList(this.message);
}

class LoadingGetMoviesList extends GetMoviesListState {
  final String? searchKeyWord;
  LoadingGetMoviesList(this.searchKeyWord);
}