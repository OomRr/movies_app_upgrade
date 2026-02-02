import 'package:equatable/equatable.dart';
import '../../../../core/utilities/enums.dart';
import '../../domain/entity/series_details_entity.dart';
import '../../domain/entity/series_recommendation_entity.dart';

class SeriesDetailsState extends Equatable {
  final SeriesDetailsEntity? seriesDetailsEntity;
  final RequestState seriesDetailsState;
  final String? seriesDetailsErrorMessage;
  final List<SeriesRecommendationEntity> seriesRecommendationEntitys;
  final RequestState seriesRecommendationState;
  final String? seriesRecommendationErrorMessage;

  const SeriesDetailsState({
    this.seriesDetailsEntity,
    this.seriesDetailsState = RequestState.isLoading,
    this.seriesDetailsErrorMessage = '',
    this.seriesRecommendationEntitys = const [],
    this.seriesRecommendationState = RequestState.isLoading,
    this.seriesRecommendationErrorMessage = '',
  });

  SeriesDetailsState copyWith({
    SeriesDetailsEntity? seriesDetailsEntity,
    RequestState? seriesDetailsState,
    String? seriesDetailsErrorMessage,
    List<SeriesRecommendationEntity>? seriesRecommendationEntitys,
    RequestState? seriesRecommendationState,
    String? seriesRecommendationErrorMessage,
  }) {
    return SeriesDetailsState(
      seriesDetailsEntity: seriesDetailsEntity ?? this.seriesDetailsEntity,
      seriesDetailsState: seriesDetailsState ?? this.seriesDetailsState,
      seriesDetailsErrorMessage:
          seriesDetailsErrorMessage ?? this.seriesDetailsErrorMessage,
      seriesRecommendationEntitys:
          seriesRecommendationEntitys ?? this.seriesRecommendationEntitys,
      seriesRecommendationState:
          seriesRecommendationState ?? this.seriesRecommendationState,
      seriesRecommendationErrorMessage:
          seriesRecommendationErrorMessage ??
          this.seriesRecommendationErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
    seriesDetailsEntity,
    seriesDetailsState,
    seriesDetailsErrorMessage,
    seriesRecommendationEntitys,
    seriesRecommendationState,
    seriesRecommendationErrorMessage,
  ];
}
