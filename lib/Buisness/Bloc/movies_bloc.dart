// ignore_for_file: invalid_use_of_visible_for_testing_member, override_on_non_overriding_member, unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:tmbd/Data/Models/movie.dart';
import 'package:tmbd/Data/Repositry/repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc(super.initialState, this.repository);

  final Repository repository;
  List<Movie> movies = [];

  List<Movie> getAllMovies(){
    repository.getAllMovies().then((movies) {
      emit(MoviesLoaded(movies));
      this.movies = movies;
    });
    return movies;
  }
}
