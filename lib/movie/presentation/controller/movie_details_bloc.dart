import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_upgrade/core/utilities/enums.dart';
import 'package:movies_upgrade/movie/domain/entity/movie_details_entity.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_recommendations.dart';

import '../../domain/entity/recommendation_entity.dart';
import '../../domain/use_case/get_movie_details.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationsUseCase getMovieRecommendationsUseCase;

  MovieDetailsBloc(
      {required this.getMovieDetailsUseCase,
      required this.getMovieRecommendationsUseCase})
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      final result =
          await getMovieDetailsUseCase(MovieDetailsParameters(id: event.id));
      print(result);
      result.fold(
          (l) => emit(state.copyWith(
              movieDetailsState: RequestState.isError,
              movieDetailsErrorMessage: l.errorMessage)),
          (r) => emit(state.copyWith(
              movieDetailsState: RequestState.isLoaded,
              movieDetailsEntity: r)));
    });
    on<GetMovieRecommendationsEvent>((event, emit) async {
      final result = await getMovieRecommendationsUseCase(
          MovieRecommendationsParameters(id: event.id));
      result.fold(
          (l) => emit(state.copyWith(
              movieRecommendationState: RequestState.isError,
              movieRecommendationErrorMessage: l.errorMessage)),
          (r) => emit(state.copyWith(
              movieRecommendationState: RequestState.isLoaded,
              movieRecommendationEntitys: r)));
    });
  }
}
