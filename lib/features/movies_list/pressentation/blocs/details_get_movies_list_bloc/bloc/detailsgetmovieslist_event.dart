part of 'detailsgetmovieslist_bloc.dart';

abstract class DetailsgetmovieslistEvent {}


class InisialEvent extends DetailsgetmovieslistEvent{}
class LoadedEvent extends DetailsgetmovieslistEvent{
  final  id;

  LoadedEvent(this.id);
}

