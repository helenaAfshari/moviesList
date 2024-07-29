
import 'package:dartz/dartz.dart';
import 'package:get_list/core/error/failures.dart';
import 'package:get_list/features/movies_list/domain/entities/get_movies_list_entity.dart';

abstract class ListMoviesRepository{
  Future<Either<Failure,GetMoviesListEntity>>getMovieList();
  
}