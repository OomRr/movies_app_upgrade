import 'package:dartz/dartz.dart';
import 'package:movies_upgrade/core/error/exceptions.dart';
import 'package:movies_upgrade/core/error/failure.dart';
import 'package:movies_upgrade/series/data/data_source/base_remote_tv_show_data_source.dart';
import 'package:movies_upgrade/series/domain/domain_repo/base_tv_repo.dart';
import 'package:movies_upgrade/series/domain/entity/series_details_entity.dart';
import 'package:movies_upgrade/series/domain/entity/series_recommendation_entity.dart';
import 'package:movies_upgrade/series/domain/entity/tv_entity.dart';

class TvShowRepository implements BaseTvShowRepo {
  BaseRemoteTvShowDataSource baseRemoteTvShowDataSource;

  TvShowRepository({required this.baseRemoteTvShowDataSource});

  @override
  Future<Either<Failure, List<TvShowEntity>>> getOnAirTvShow() async {
    final result = await baseRemoteTvShowDataSource.getOnAirTvShow();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvShowEntity>>> getPopularTvShow() async {
    final result = await baseRemoteTvShowDataSource.getPopularTvShow();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvShowEntity>>> getTopRatedTvShow() async {
    final result = await baseRemoteTvShowDataSource.getTopRatedTvShow();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SeriesDetailsEntity>> getTvShowDetails(int id) async {
    try {
      final result = await baseRemoteTvShowDataSource.getTvShowDetails(id);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<SeriesRecommendationEntity>>>
  getTvShowRecommendations(int id) async {
    try {
      final result = await baseRemoteTvShowDataSource.getTvShowRecommendations(
        id,
      );
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
