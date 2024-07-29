
import 'package:get_list/features/movies_list/data/models/get_movies_list_model.dart';

abstract class NumberTriviaLocalDataSource {
  
  Future<GetMoviesListModel> getLastListMovies();
  Future<void> catchListMovies(GetMoviesListModel moviesToCache);
}