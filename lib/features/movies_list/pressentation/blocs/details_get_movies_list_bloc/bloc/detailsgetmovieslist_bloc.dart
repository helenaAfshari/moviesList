import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_list/features/movies_list/domain/entities/details_get_movies_entity.dart';
import 'package:get_list/features/movies_list/domain/usecases/details_get_movies_list_usecase.dart';

part 'detailsgetmovieslist_event.dart';
part 'detailsgetmovieslist_state.dart';
class DetailsgetmovieslistBloc extends Bloc<DetailsgetmovieslistEvent, DetailsgetmovieslistState> {
  DetailsGetMoviesListUsecase _detailsUseCase;
  DetailsgetmovieslistBloc(this._detailsUseCase) : super(InisialDetailsState()) {

    on<DetailsgetmovieslistEvent>((event, emit) async { // async اضافه شده
      if(event is LoadedEvent){
        try {
          emit(LoadingDetailsState());
          final details = await _detailsUseCase.call(params: event.id); // await اضافه شده
          emit(LoadedDetailsState(details));
        } catch(e) {
          emit(ErrorDetailsState(message: e.toString())); // Error handling اضافه شده
        }
      }
    });
  }
}

