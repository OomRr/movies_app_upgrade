import 'package:dartz/dartz.dart';
import 'package:movies_upgrade/core/error/exceptions.dart';
import 'package:movies_upgrade/movie/data/data_source/base_remote_movie_data_source.dart';
import 'package:movies_upgrade/movie/domain/domain_repo/base_movie_repo.dart';
import 'package:movies_upgrade/movie/domain/entity/movie_details_entity.dart';
import 'package:movies_upgrade/movie/domain/entity/movie_entity.dart';
import 'package:movies_upgrade/movie/domain/entity/recommendation_entity.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_movie_details.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_recommendations.dart';

import '../../../core/error/failure.dart';

class MovieRepo extends BaseMovieRepo {
  BaseRemoteMovieDataSource baseRemoteMovieDataSource;

  MovieRepo(this.baseRemoteMovieDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    final result = await baseRemoteMovieDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    final result = await baseRemoteMovieDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    final result = await baseRemoteMovieDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
    MovieDetailsParameters parameters,
  ) async {
    final result = await baseRemoteMovieDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieRecommendationEntity>>>
  getMovieRecommendations(MovieRecommendationsParameters parameters) async {
    final result = await baseRemoteMovieDataSource.getMovieRecommendations(
      parameters,
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
