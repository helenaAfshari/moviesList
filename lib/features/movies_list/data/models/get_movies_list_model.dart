
import 'package:get_list/features/movies_list/domain/entities/get_movies_list_entity.dart';
class GetMoviesListModel extends GetMoviesListEntity {
  GetMoviesListModel({
    required int id,
    required String title,
    required String poster,
    required List<String> genres,
    required List<String> images,
  }) : super(id: id, title: title, poster: poster, genres: genres, images: images);

  factory GetMoviesListModel.fromJson(Map<String, dynamic> json) {
    return GetMoviesListModel(
      id: json['id'],
      title: json['title'],
      poster: json['poster'],
      genres: List<String>.from(json['genres']),
      images: List<String>.from(json['images']),
    );
  }
}
