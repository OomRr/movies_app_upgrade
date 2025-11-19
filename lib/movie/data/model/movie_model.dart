import 'package:movies_upgrade/movie/domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel(
      {required super.title,
      required super.id,
      required super.overview,
      required super.voteAverage,
      required super.posterPath,
      required super.releaseDate,
      required super.genreIds});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json['title'],
        id: json['id'],
        overview: json['overview'],
        voteAverage: json['vote_average'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      );
}
