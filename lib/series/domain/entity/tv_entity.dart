import 'package:equatable/equatable.dart';

class TvShowEntity extends Equatable {
  final int id;
  final bool adult;
  final List<int> genreIds;
  final String originalName;
  final String posterPath;
  final double voteAverage;
  final String firstAirDate;
  final String overview;

  const TvShowEntity({
    required this.id,
    required this.adult,
    required this.genreIds,
    required this.originalName,
    required this.posterPath,
    required this.voteAverage,
    required this.firstAirDate,
    required this.overview,
  });

  @override
  List<Object> get props => [
    id,
    adult,
    genreIds,
    originalName,
    posterPath,
    voteAverage,
    firstAirDate,
    overview,
  ];
}
