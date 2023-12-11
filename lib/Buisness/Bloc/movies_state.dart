part of 'movies_bloc.dart';

abstract class MoviesState {
}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState{
final List<Movie> movies;

  MoviesLoaded(this.movies);
}
