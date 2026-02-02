import 'package:dartz/dartz.dart';
import 'package:movies_upgrade/core/error/failure.dart';
import '../domain_repo/base_tv_repo.dart';
import '../entity/series_recommendation_entity.dart';

class GetTvShowRecommendationsUseCase {
  final BaseTvShowRepo repository;

  GetTvShowRecommendationsUseCase(this.repository);

  Future<Either<Failure, List<SeriesRecommendationEntity>>> execute(
    int id,
  ) async {
    return await repository.getTvShowRecommendations(id);
  }
}
