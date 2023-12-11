// ignore_for_file: file_names, constant_pattern_never_matches_value_type, body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:tmbd/Buisness/Bloc/movies_bloc.dart';
import 'package:tmbd/Data/Repositry/repository.dart';
import 'package:tmbd/Data/Web/Web_Services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmbd/Constants/Api.dart';
import 'package:tmbd/Presentation/Screens/movie_Screen.dart';
import 'package:tmbd/Presentation/Screens/movie_details.dart';

class AppRouter {
  late Repository repository;
  late MoviesBloc moviesBloc;
  late MoviesState initialState;
  

  AppRouter() {
    repository = Repository(
      WebServices(),
    );
    moviesBloc = MoviesBloc(initialState, repository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext contxt) => moviesBloc,
                  child: const MoviesScreen(),
                ));
      case characterDetails:
      return MaterialPageRoute(builder: (_) => const MovieDetails());
    }
  }
}
