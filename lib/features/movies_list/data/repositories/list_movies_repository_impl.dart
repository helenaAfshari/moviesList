
// import 'package:dartz/dartz.dart';
// import 'package:get_list/core/error/exceptions.dart';
// import 'package:get_list/core/error/failures.dart';
// import 'package:get_list/core/network_eso/network_info.dart';
// import 'package:get_list/features/movies_list/data/data_source/list_movies_local_data_source.dart';
// import 'package:get_list/features/movies_list/data/data_source/list_movies_remote_data_source.dart';
// import 'package:get_list/features/movies_list/domain/entities/get_movies_list_entity.dart';
// import 'package:get_list/features/movies_list/domain/repositories/list_movies_repository.dart';

// class ListMoviesRepositoryImpl extends ListMoviesRepository{
//   final ListMoviesRemoteDataSource remoteDataSource;
//   final NumberTriviaLocalDataSource localDataSource;
//   final NetworkInfo networkInfo;

//   ListMoviesRepositoryImpl({
//     required this.remoteDataSource, 
//     required this.localDataSource, 
//     required this.networkInfo});
//   @override
//   Future<Either<Failure, GetMoviesListEntity>> getMovieList(
     
//   )async{
//      if (await networkInfo.isConnected) {
//     try {
//       final remoteTrivia =
//           await remoteDataSource.getListMovies();
//       localDataSource.catchListMovies(remoteTrivia);
//       return Right(remoteTrivia);
//     } on ServerExeption {
//       return Left(ServerFailure());
//     }
//   } else {
//     final localTrivia = await localDataSource.getLastListMovies();
//     return Right(localTrivia);
//   }
//   }
// }

