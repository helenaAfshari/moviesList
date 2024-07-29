


import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_list/core/network/api_provider.dart';
import 'package:get_list/core/network/api_provider_imp.dart';
import 'package:get_list/features/movies_list/data/data_source/remote/dtails_get_movies/details_get_movies_api.dart';
import 'package:get_list/features/movies_list/data/data_source/remote/dtails_get_movies/details_get_movies_api_impl.dart';
import 'package:get_list/features/movies_list/data/data_source/remote/getmovieslist/get_movies_list_api%20_impl.dart';
import 'package:get_list/features/movies_list/data/data_source/remote/getmovieslist/get_movies_list_api.dart';
import 'package:get_list/features/movies_list/data/repositories/details_get_movies_repository_impl.dart';
import 'package:get_list/features/movies_list/data/repositories/get_movies_list_repository_impl.dart';
import 'package:get_list/features/movies_list/domain/repositories/details_get_movies_repository.dart';
import 'package:get_list/features/movies_list/domain/repositories/get_movies_list_repository.dart';
import 'package:get_list/features/movies_list/domain/usecases/details_get_movies_list_usecase.dart';
import 'package:get_list/features/movies_list/domain/usecases/get_movies_list_usecase.dart';


final serviceLocator = GetIt.instance;

void injector() {
  
  serviceLocator.registerFactory<ApiProvider>(() => ApiProviderImp());
  serviceLocator.registerFactory<GetMoviesListApi>(() => GetMoviesListDataSourceApiImpl(serviceLocator()));

  serviceLocator.registerFactory<GetMoviesListRepository>(() => GetMoviesListRepositoryImpl(serviceLocator<ApiProvider>()));

  serviceLocator.registerFactory<GetMoviesListUsecase>(() => GetMoviesListUsecase(serviceLocator()));
    serviceLocator.registerFactory<DetailsGetMoviesApi>(() => DetailsGetMoviesApiImpl(serviceLocator()));
    serviceLocator.registerFactory<DetailsGetMoviesRepository>(() => DetailsGetMoviesRepositoryImpl(serviceLocator()));
    serviceLocator.registerFactory<DetailsGetMoviesListUsecase>(() => DetailsGetMoviesListUsecase(serviceLocator()));

}



