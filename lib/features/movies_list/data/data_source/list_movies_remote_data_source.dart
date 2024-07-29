

import 'package:get_list/features/movies_list/data/models/get_movies_list_model.dart';

abstract class ListMoviesRemoteDataSource {
  Future<GetMoviesListModel> getListMovies();
}