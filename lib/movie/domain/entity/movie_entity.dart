import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final int id;
  final String overview;
  final double voteAverage;
  final String posterPath;
  final String releaseDate;
  final List<int> genreIds;

  const MovieEntity(
      {required this.title,
      required this.id,
      required this.overview,
      required this.voteAverage,
      required this.posterPath,
      required this.releaseDate,
      required this.genreIds});

  @override
  List<Object> get props => [
        title,
        id,
        overview,
        voteAverage,
        posterPath,
        releaseDate,
        genreIds,
      ];
}
