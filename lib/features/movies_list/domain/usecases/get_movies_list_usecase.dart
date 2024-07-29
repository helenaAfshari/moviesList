
import 'package:get_list/core/usecases/usecase.dart';
import 'package:get_list/features/movies_list/domain/entities/get_movies_list_entity.dart';
import 'package:get_list/features/movies_list/domain/repositories/get_movies_list_repository.dart';


class GetMoviesListUsecase implements UseCase<List<GetMoviesListEntity>, dynamic> {
  final GetMoviesListRepository repository;

  GetMoviesListUsecase(this.repository);

  @override
  Future<List<GetMoviesListEntity>> call({params}) async {
    return await repository.getMoviesListRepository();
  }
}

