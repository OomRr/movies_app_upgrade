import 'package:movies_upgrade/series/domain/entity/tv_entity.dart';

class TvShowModel extends TvShowEntity {
  const TvShowModel({
    required super.id,
    required super.adult,
    required super.genreIds,
    required super.originalName,
    required super.backdropPath,
    required super.voteAverage,
    required super.firstAirDate,
    required super.overview,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) => TvShowModel(
    id: json['id'],
    adult: json['adult'],
    //here how to get list from json
    genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
    originalName: json['original_name'],
    backdropPath: json['backdrop_path'],
    voteAverage: json['vote_average'].toDouble(),
    firstAirDate: json['first_air_date'],
    overview: json['overview'],
  );

}
