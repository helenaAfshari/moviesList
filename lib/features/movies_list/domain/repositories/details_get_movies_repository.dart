
import 'package:get_list/features/movies_list/domain/entities/details_get_movies_entity.dart';

abstract class DetailsGetMoviesRepository {
  Future<DetailsGetMoviesEntity> detailsGetMovies(int movieId);
}