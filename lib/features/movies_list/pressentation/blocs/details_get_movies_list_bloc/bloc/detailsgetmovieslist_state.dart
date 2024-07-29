part of 'detailsgetmovieslist_bloc.dart';

abstract class DetailsgetmovieslistState {}

class InisialDetailsState extends DetailsgetmovieslistState {}
class LoadingDetailsState extends DetailsgetmovieslistState {}
class LoadedDetailsState extends DetailsgetmovieslistState {
  final DetailsGetMoviesEntity details; // تغییر به یک آبجکت
  LoadedDetailsState(this.details);
}
class ErrorDetailsState extends DetailsgetmovieslistState {
  final String message;
  ErrorDetailsState({required this.message});
}
