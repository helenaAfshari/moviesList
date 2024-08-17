
import 'package:get_list/features/movies_list/data/data_source/remote/getmovieslist/get_movies_list_api.dart';
import 'package:get_list/features/movies_list/domain/entities/get_movies_list_entity.dart';

class GetMoviesListDataSourceApiImpl implements GetMoviesListApi {
final GetMoviesListApi _api;
  GetMoviesListDataSourceApiImpl(this._api);

  @override
  Future<List<GetMoviesListEntity>> getMoviesList() async {
      return await _api.getMoviesList();
      
  }
}