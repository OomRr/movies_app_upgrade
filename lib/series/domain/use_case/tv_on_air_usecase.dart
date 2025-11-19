import 'package:dartz/dartz.dart';
import 'package:movies_upgrade/core/error/failure.dart';
import 'package:movies_upgrade/core/usecase/base_use_case.dart';
import 'package:movies_upgrade/series/domain/domain_repo/base_tv_repo.dart';
import 'package:movies_upgrade/series/domain/entity/tv_entity.dart';

class TvOnAirUseCase {
  BaseTvShowRepo baseTvShowRepo;

  TvOnAirUseCase(this.baseTvShowRepo);

  Future<Either<Failure, List<TvShowEntity>>> call(NoParameter noParameter) {
    return baseTvShowRepo.getOnAirTvShow();
  }
}
