
import 'package:get_list/core/network/api_provider.dart';
import 'package:get_list/features/movies_list/data/models/get_movies_list_model.dart';
import 'package:get_list/features/movies_list/domain/entities/get_movies_list_entity.dart';
import 'package:get_list/features/movies_list/domain/repositories/get_movies_list_repository.dart';

class GetMoviesListRepositoryImpl implements GetMoviesListRepository {
 final ApiProvider _apiProvider;
   GetMoviesListRepositoryImpl(this._apiProvider);

   @override
   Future<List<GetMoviesListEntity>> getMoviesListRepository() async {
     final response = await _apiProvider.get('movies?page=');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'];
      List<GetMoviesListEntity> movies = data.map((json) => GetMoviesListModel.fromJson(json)).toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
   }
}
