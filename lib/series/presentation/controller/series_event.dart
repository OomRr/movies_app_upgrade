part of 'series_bloc.dart';

sealed class SeriesEvent extends Equatable {
  const SeriesEvent();

  @override
  List<Object> get props => [];
}

class GetOnAirTvShowEvent extends SeriesEvent {}

class GetPopularTvShowEvent extends SeriesEvent {}

class GetTopRatedTvShowEvent extends SeriesEvent {}