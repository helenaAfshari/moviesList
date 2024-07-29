

//مدل که از سرور هست
class GetMoviesListEntity {
  final int id;
  final String title;
  final String poster;
  final List<String> genres;
  final List<String> images;
   GetMoviesListEntity({
    required this.id,
    required this.title,
    required this.poster,
    required this.genres,
    required this.images,
  });
  
  
}

