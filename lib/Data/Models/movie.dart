// ignore_for_file: file_names

class Movie {
  final int id;
  final bool video;
  final int voteCount;
  final double voteAverage;
  final String title;
  final String releaseDate;
  final String originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final String backdropPath;
  final bool adult;
  final String overview;
  final String posterPath;
  final double popularity;
  final String mediaType;

  Movie({
    required this.id,
    required this.video,
    required this.voteCount,
    required this.voteAverage,
    required this.title,
    required this.releaseDate,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.backdropPath,
    required this.adult,
    required this.overview,
    required this.posterPath,
    required this.popularity,
    required this.mediaType,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      popularity: json['popularity']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'],
      video: json['video'],
      posterPath: json['poster_path'],
      id: json['id'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids'].cast<int>(),
      title: json['title'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      overview: json['overview'],
      releaseDate: json['release_date'],
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['video'] = video;
    data['vote_count'] = voteCount;
    data['vote_average'] = voteAverage;
    data['title'] = title;
    data['release_date'] = releaseDate;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['genre_ids'] = genreIds;
    data['backdrop_path'] = backdropPath;
    data['adult'] = adult;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['popularity'] = popularity;
    data['media_type'] = mediaType;
    return data;
  }
}