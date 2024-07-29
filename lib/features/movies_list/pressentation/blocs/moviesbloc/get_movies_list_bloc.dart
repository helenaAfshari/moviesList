import 'package:bloc/bloc.dart';
import 'package:get_list/features/movies_list/domain/entities/get_movies_list_entity.dart';
import 'package:get_list/features/movies_list/domain/usecases/get_movies_list_usecase.dart';
part 'get_movies_list_event.dart';
part 'get_movies_list_state.dart';

class GetMoviesListBloc extends Bloc<GetMoviesListEvent, GetMoviesListState> {
  final GetMoviesListUsecase _getMoviesListUsecase;

  GetMoviesListBloc(this._getMoviesListUsecase,) : super(InitialGetMoviesList()) {
  
  
    on<SearchBarEvent>((event, emit) async {
      try {
        emit(LoadingGetMoviesList(event.searchKeyWord));

        final movies = await _getMoviesListUsecase.call();

        emit(LoadedGetMoviesList(movies));
      } catch (e) {
        emit(ErrorGetMoviesList(e.toString()));
      }
    });
  }
  }



