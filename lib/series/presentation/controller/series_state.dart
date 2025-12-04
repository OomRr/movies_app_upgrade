part of 'series_bloc.dart';

class SeriesState extends Equatable {
  final List<TvShowEntity>? onAirTvShows;
  final List<TvShowEntity>? popularTvShows;
  final List<TvShowEntity>? topRatedTvShows;
  final RequestState? onAirRequestState;
  final RequestState? popularRequestState;
  final RequestState? topRatedRequestState;
  final String? onAirErrorMessage;
  final String? popularErrorMessage;
  final String? topRatedErrorMessage;

  const SeriesState({
    this.onAirTvShows,
    this.popularTvShows,
    this.topRatedTvShows,
    this.onAirRequestState = RequestState.isLoading,
    this.popularRequestState = RequestState.isLoading,
    this.topRatedRequestState = RequestState.isLoading,
    this.onAirErrorMessage,
    this.popularErrorMessage,
    this.topRatedErrorMessage,
  });
  SeriesState copyWith({
    List<TvShowEntity>? onAirTvShows,
    List<TvShowEntity>? popularTvShows,
    List<TvShowEntity>? topRatedTvShows,
    RequestState? onAirRequestState,
    RequestState? popularRequestState,
    RequestState? topRatedRequestState,
    String? onAirErrorMessage,
    String? popularErrorMessage,
    String? topRatedErrorMessage,
  }) {
    return SeriesState(
      onAirTvShows: onAirTvShows ?? this.onAirTvShows,
      popularTvShows: popularTvShows ?? this.popularTvShows,
      topRatedTvShows: topRatedTvShows ?? this.topRatedTvShows,
      onAirRequestState: onAirRequestState ?? this.onAirRequestState,
      popularRequestState: popularRequestState ?? this.popularRequestState,
      topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,
      onAirErrorMessage: onAirErrorMessage ?? this.onAirErrorMessage,
      popularErrorMessage: popularErrorMessage ?? this.popularErrorMessage,
      topRatedErrorMessage: topRatedErrorMessage ?? this.topRatedErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
    onAirTvShows,
    popularTvShows,
    topRatedTvShows,
    onAirRequestState,
    popularRequestState,
    topRatedRequestState,
    onAirErrorMessage,
    popularErrorMessage,
    topRatedErrorMessage,
  ];
}
