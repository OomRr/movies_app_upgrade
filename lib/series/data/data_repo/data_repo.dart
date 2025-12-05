import 'package:dartz/dartz.dart';
import 'package:movies_upgrade/core/error/exceptions.dart';
import 'package:movies_upgrade/core/error/failure.dart';
import 'package:movies_upgrade/series/data/data_source/base_remote_tv_show_data_source.dart';
import 'package:movies_upgrade/series/domain/domain_repo/base_tv_repo.dart';
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

  /*  @override
  Future<Either<Failure, TvShowEntity>> getTvShowDetails(int id) async{
    final result=await baseRemoteTvShowDataSource.getDetailsTvShow();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }*/
}
