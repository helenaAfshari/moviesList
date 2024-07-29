
import 'package:get_list/features/movies_list/domain/entities/details_get_movies_entity.dart';

abstract class DetailsGetMoviesApi {
  Future<DetailsGetMoviesEntity> detailsGetMovies(int movieId);
}