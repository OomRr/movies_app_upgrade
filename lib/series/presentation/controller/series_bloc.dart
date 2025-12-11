import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_upgrade/core/usecase/base_use_case.dart';
import 'package:movies_upgrade/core/utilities/enums.dart';
import 'package:movies_upgrade/series/domain/entity/tv_entity.dart';
import 'package:movies_upgrade/series/domain/use_case/tv_on_air_usecase.dart';
import 'package:movies_upgrade/series/domain/use_case/tv_popular_usecase.dart';
import 'package:movies_upgrade/series/domain/use_case/tv_top_rated_usecase.dart';

part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final TvOnAirUseCase tvOnAirUseCase;
  final TvPopularUseCase tvPopularUseCase;
  final TvTopRatedUseCase tvTopRatedUseCase;

  SeriesBloc({
    required this.tvOnAirUseCase,
    required this.tvPopularUseCase,
    required this.tvTopRatedUseCase,
  }) : super(SeriesState()) {
    on<GetOnAirTvShowEvent>((event, emit) async {
      if (state.onAirTvShows != null &&
          state.topRatedTvShows != null &&
          state.popularTvShows != null) {
        return;
      }
      final result = await tvOnAirUseCase(NoParameter());
      result.fold(
        (l) => emit(
          state.copyWith(
            onAirRequestState: RequestState.isError,
            onAirErrorMessage: l.errorMessage,
          ),
        ),
        (r) => emit(
          state.copyWith(
            onAirTvShows: r,
            onAirRequestState: RequestState.isLoaded,
          ),
        ),
      );
    });
    on<GetPopularTvShowEvent>((event, emit) async {
      final result = await tvPopularUseCase(NoParameter());
      result.fold(
        (l) => emit(
          state.copyWith(
            popularRequestState: RequestState.isError,
            popularErrorMessage: l.errorMessage,
          ),
        ),
        (r) => emit(
          state.copyWith(
            popularTvShows: r,
            popularRequestState: RequestState.isLoaded,
          ),
        ),
      );
    });
    on<GetTopRatedTvShowEvent>((event, emit) async {
      final result = await tvTopRatedUseCase(NoParameter());

      result.fold(
        (l) => emit(
          state.copyWith(
            topRatedRequestState: RequestState.isError,
            topRatedErrorMessage: l.errorMessage,
          ),
        ),
        (r) => emit(
          state.copyWith(
            topRatedTvShows: r,
            topRatedRequestState: RequestState.isLoaded,
          ),
        ),
      );
    });
  }
}
