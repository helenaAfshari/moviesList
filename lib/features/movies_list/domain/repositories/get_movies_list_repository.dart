import 'package:get_list/features/movies_list/domain/entities/get_movies_list_entity.dart';

abstract class GetMoviesListRepository {
  Future<List<GetMoviesListEntity>> getMoviesListRepository();
  
}