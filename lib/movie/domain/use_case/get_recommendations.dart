import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_upgrade/core/error/failure.dart';

import '../../../core/usecase/base_use_case.dart';
import '../domain_repo/base_movie_repo.dart';
import '../entity/recommendation_entity.dart';

class GetMovieRecommendationsUseCase extends BaseUseCase<List<MovieRecommendationEntity>, MovieRecommendationsParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetMovieRecommendationsUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<MovieRecommendationEntity>>> call(MovieRecommendationsParameters parameter) async {
    return await baseMovieRepo.getMovieRecommendations(parameter);
  }

}

class MovieRecommendationsParameters extends Equatable {
  final int id;

  const MovieRecommendationsParameters({required this.id});

  @override
  List<Object> get props => [id];
}
