import 'package:equatable/equatable.dart';

abstract class SeriesDetailsEvent extends Equatable {
  const SeriesDetailsEvent();

  @override
  List<Object?> get props => [];
}

class GetSeriesDetailsEvent extends SeriesDetailsEvent {
  final int id;

  const GetSeriesDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetSeriesRecommendationsEvent extends SeriesDetailsEvent {
  final int id;

  const GetSeriesRecommendationsEvent(this.id);

  @override
  List<Object?> get props => [id];
}
