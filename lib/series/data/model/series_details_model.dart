import '../../domain/entity/series_details_entity.dart';
import '../../../movie/data/model/genres_model.dart';

class SeriesDetailsModel extends SeriesDetailsEntity {
  const SeriesDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.numberOfSeasons,
    required super.voteAverage,
    required super.name,
    required super.overview,
    required super.firstAirDate,
  });

  factory SeriesDetailsModel.fromJson(Map<String, dynamic> json) =>
      SeriesDetailsModel(
        backdropPath: json['backdrop_path'],
        genres: List<GenresModel>.from(
          (json['genres'] as List).map((e) => GenresModel.fromJson(e)),
        ),
        id: json['id'],
        numberOfSeasons: json['number_of_seasons'] ?? 0,
        voteAverage: json['vote_average'].toDouble(),
        name: json['name'],
        overview: json['overview'],
        firstAirDate: json['first_air_date'],
      );
}
