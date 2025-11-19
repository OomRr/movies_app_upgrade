import 'package:dartz/dartz.dart';
import 'package:movies_upgrade/movie/domain/entity/movie_entity.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../domain_repo/base_movie_repo.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<MovieEntity>,NoParameter> {
  final BaseMovieRepo baseMovieRpo;

  GetPopularMoviesUseCase(this.baseMovieRpo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParameter noParameter) async {
    return await baseMovieRpo.getPopularMovies();
  }
}
