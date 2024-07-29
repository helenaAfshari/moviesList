
import 'package:get_list/core/network/api_provider.dart';
import 'package:get_list/features/movies_list/data/models/details_get_movies_model.dart';
import 'package:get_list/features/movies_list/domain/entities/details_get_movies_entity.dart';
import 'package:get_list/features/movies_list/domain/repositories/details_get_movies_repository.dart';

class DetailsGetMoviesRepositoryImpl implements DetailsGetMoviesRepository{
  final ApiProvider _apiProvider;
  DetailsGetMoviesRepositoryImpl(this._apiProvider);
  
  @override
 Future<DetailsGetMoviesEntity> detailsGetMovies(int movieId) async {
  final response = await _apiProvider.get('movies/$movieId'); 
  if (response.statusCode == 200) {
    Map<String, dynamic> data = response.data; // دریافت آبجکت JSON
     DetailsGetMoviesEntity detailsMovie = DetailsGetMoviesModel.fromJson(data); // تبدیل به مدل
    return detailsMovie;
  } else {
    throw Exception('Failed to load DetailsMovies');
  }
}


}
