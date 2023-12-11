import 'package:tmbd/Data/Web/Web_Services.dart';
import 'package:tmbd/Data/Models/movie.dart';

class Repository {
  final WebServices webServices;
  Repository(this.webServices);

  Future<List<Movie>> getAllMovies() async{
    final movies = await webServices.getAllMovies();
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }
}