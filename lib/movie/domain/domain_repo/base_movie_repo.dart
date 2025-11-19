import 'package:dartz/dartz.dart';
import 'package:movies_upgrade/movie/domain/entity/movie_details_entity.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_movie_details.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_recommendations.dart';

import '../../../core/error/failure.dart';
import '../entity/movie_entity.dart';
import '../entity/recommendation_entity.dart';

abstract class BaseMovieRepo {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();

  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
    MovieDetailsParameters parameters,
  );

  Future<Either<Failure, List<MovieRecommendationEntity>>>
  getMovieRecommendations(MovieRecommendationsParameters parameters);
}
