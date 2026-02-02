import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utilities/enums.dart';
import '../../domain/use_case/get_tv_show_details_usecase.dart';
import '../../domain/use_case/get_tv_show_recommendations_usecase.dart';
import 'series_details_event.dart';
import 'series_details_state.dart';

class SeriesDetailsBloc extends Bloc<SeriesDetailsEvent, SeriesDetailsState> {
  final GetTvShowDetailsUseCase getTvShowDetailsUseCase;
  final GetTvShowRecommendationsUseCase getTvShowRecommendationsUseCase;

  SeriesDetailsBloc({
    required this.getTvShowDetailsUseCase,
    required this.getTvShowRecommendationsUseCase,
  }) : super(const SeriesDetailsState()) {
    on<GetSeriesDetailsEvent>(_getSeriesDetails);
    on<GetSeriesRecommendationsEvent>(_getSeriesRecommendations);
  }

  FutureOr<void> _getSeriesDetails(
    GetSeriesDetailsEvent event,
    Emitter<SeriesDetailsState> emit,
  ) async {
    final result = await getTvShowDetailsUseCase.execute(event.id);

    result.fold(
      (l) => emit(
        state.copyWith(
          seriesDetailsState: RequestState.isError,
          seriesDetailsErrorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          seriesDetailsEntity: r,
          seriesDetailsState: RequestState.isLoaded,
        ),
      ),
    );
  }

  FutureOr<void> _getSeriesRecommendations(
    GetSeriesRecommendationsEvent event,
    Emitter<SeriesDetailsState> emit,
  ) async {
    final result = await getTvShowRecommendationsUseCase.execute(event.id);

    result.fold(
      (l) => emit(
        state.copyWith(
          seriesRecommendationState: RequestState.isError,
          seriesRecommendationErrorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          seriesRecommendationEntitys: r,
          seriesRecommendationState: RequestState.isLoaded,
        ),
      ),
    );
  }
}
