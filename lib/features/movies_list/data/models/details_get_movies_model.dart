
import 'package:get_list/features/movies_list/domain/entities/details_get_movies_entity.dart';

class DetailsGetMoviesModel extends DetailsGetMoviesEntity{
  DetailsGetMoviesModel({
    required  int id, 
    required String title, 
    required String poster})
    :super(id: id,title: title,poster: poster);

   factory DetailsGetMoviesModel.fromJson(Map<String,dynamic> json){
    return DetailsGetMoviesModel(
    id: json['id'],
    title: json['title'],
    poster: json['poster'],
    );
   }
}