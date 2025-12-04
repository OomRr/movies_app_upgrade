import 'package:movies_upgrade/movie/data/model/movie_details_model.dart';
import 'package:movies_upgrade/movie/data/model/movie_model.dart';
import 'package:movies_upgrade/movie/data/model/recommendation_model.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_movie_details.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_recommendations.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<MovieRecommendationModel>> getMovieRecommendations(
    MovieRecommendationsParameters parameters,
  );
}
