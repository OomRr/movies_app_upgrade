import 'package:equatable/equatable.dart';
import 'genres_entity.dart';

class MovieDetailsEntity extends Equatable {
  final String? backdropPath;
  final List<GenresEntity> genres;
  final int id;
  final int runtime;
  final double voteAverage;
  final String title;
  final String overview;
  final String releaseDate;

  const MovieDetailsEntity({required this.backdropPath,
    required this.genres,
    required this.id,
    required this.runtime,
    required this.voteAverage,
    required this.title,
    required this.overview,
    required this.releaseDate});

  @override
  List<Object?> get props =>
      [
        backdropPath,
        genres,
        id,
        runtime,
        voteAverage,
        title,
        overview,
        releaseDate,
      ];
}
