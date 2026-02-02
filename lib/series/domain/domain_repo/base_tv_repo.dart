import 'package:dartz/dartz.dart';
import 'package:movies_upgrade/core/error/failure.dart';
import 'package:movies_upgrade/series/domain/entity/series_details_entity.dart';
import 'package:movies_upgrade/series/domain/entity/series_recommendation_entity.dart';
import 'package:movies_upgrade/series/domain/entity/tv_entity.dart';

abstract class BaseTvShowRepo {
  Future<Either<Failure, List<TvShowEntity>>> getOnAirTvShow();
  Future<Either<Failure, List<TvShowEntity>>> getPopularTvShow();
  Future<Either<Failure, List<TvShowEntity>>> getTopRatedTvShow();
  Future<Either<Failure, SeriesDetailsEntity>> getTvShowDetails(int id);
  Future<Either<Failure, List<SeriesRecommendationEntity>>>
  getTvShowRecommendations(int id);
}
