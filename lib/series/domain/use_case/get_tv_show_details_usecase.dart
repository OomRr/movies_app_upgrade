import 'package:dartz/dartz.dart';
import 'package:movies_upgrade/core/error/failure.dart';
import '../domain_repo/base_tv_repo.dart';
import '../entity/series_details_entity.dart';

class GetTvShowDetailsUseCase {
  final BaseTvShowRepo repository;

  GetTvShowDetailsUseCase(this.repository);

  Future<Either<Failure, SeriesDetailsEntity>> execute(int id) async {
    return await repository.getTvShowDetails(id);
  }
}
