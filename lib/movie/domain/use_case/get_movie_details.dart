import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_upgrade/core/error/failure.dart';
import 'package:movies_upgrade/core/usecase/base_use_case.dart';
import 'package:movies_upgrade/movie/domain/domain_repo/base_movie_repo.dart';
import 'package:movies_upgrade/movie/domain/entity/movie_details_entity.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetailsEntity, MovieDetailsParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetMovieDetailsUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(MovieDetailsParameters parameter) async {
    return await baseMovieRepo.getMovieDetails(parameter);
  }
}

class MovieDetailsParameters extends Equatable {
  final int id;

  const MovieDetailsParameters({required this.id});

  @override
  List<Object> get props => [id];
}
