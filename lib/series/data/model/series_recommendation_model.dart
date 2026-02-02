import '../../domain/entity/series_recommendation_entity.dart';

class SeriesRecommendationModel extends SeriesRecommendationEntity {
  const SeriesRecommendationModel({required super.id, super.backDropPath});

  factory SeriesRecommendationModel.fromJson(Map<String, dynamic> json) =>
      SeriesRecommendationModel(
        id: json['id'],
        backDropPath: json['backdrop_path'] ?? json['poster_path'],
      );
}
