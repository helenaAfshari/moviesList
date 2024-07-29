

import 'package:get_list/features/movies_list/data/data_source/remote/dtails_get_movies/details_get_movies_api.dart';
import 'package:get_list/features/movies_list/domain/entities/details_get_movies_entity.dart';

class DetailsGetMoviesApiImpl implements DetailsGetMoviesApi {
 final DetailsGetMoviesApi _api;
  DetailsGetMoviesApiImpl(this._api);
  
  @override
  Future<DetailsGetMoviesEntity> detailsGetMovies(int movieId) {
       return _api.detailsGetMovies(movieId);

  }
}