
import 'package:get_list/core/usecases/usecase.dart';
import 'package:get_list/features/movies_list/domain/entities/details_get_movies_entity.dart';
import 'package:get_list/features/movies_list/domain/repositories/details_get_movies_repository.dart';


class DetailsGetMoviesListUsecase extends UseCase<DetailsGetMoviesEntity, int> {
  final DetailsGetMoviesRepository repository;

  DetailsGetMoviesListUsecase(this.repository);

  @override
  Future<DetailsGetMoviesEntity> call({required int params}) async {
    return await repository.detailsGetMovies(params);
  }
}
