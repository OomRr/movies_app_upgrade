import 'package:equatable/equatable.dart';
import '../../../movie/domain/entity/genres_entity.dart';

class SeriesDetailsEntity extends Equatable {
  final String? backdropPath;
  final List<GenresEntity> genres;
  final int id;
  final int numberOfSeasons;
  final double voteAverage;
  final String name;
  final String overview;
  final String firstAirDate;

  const SeriesDetailsEntity({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.numberOfSeasons,
    required this.voteAverage,
    required this.name,
    required this.overview,
    required this.firstAirDate,
  });

  @override
  List<Object?> get props => [
    backdropPath,
    genres,
    id,
    numberOfSeasons,
    voteAverage,
    name,
    overview,
    firstAirDate,
  ];
}
