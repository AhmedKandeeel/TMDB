part of 'movies_bloc.dart';

abstract class MoviesEvent{
  const MoviesEvent();

}

class MoviesLoadEvent extends MoviesEvent{
  final int defaultIndex;

  const MoviesLoadEvent({this.defaultIndex = 0}):
  assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');
}