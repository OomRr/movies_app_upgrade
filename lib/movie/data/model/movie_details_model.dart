import 'package:movies_upgrade/movie/data/model/genres_model.dart';
import 'package:movies_upgrade/movie/domain/entity/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.genres,
      required super.id,
      required super.runtime,
      required super.voteAverage,
      required super.title,
      required super.overview,
      required super.releaseDate});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backdropPath: json['backdrop_path']??'/ilpp1j0rF67uMiFnY33jTSfR5HM.jpg',
          genres: List<GenresModel>.from(
              json['genres'].map((e) => GenresModel.fromJson(e))),
          id: json['id'],
          runtime: json['runtime'],
          voteAverage: json['vote_average'].toDouble(),
          title: json['title'],
          overview: json['overview'],
          releaseDate: json['release_date']);
}
