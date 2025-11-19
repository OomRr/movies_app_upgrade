import 'package:movies_upgrade/movie/domain/entity/recommendation_entity.dart';

class MovieRecommendationModel extends MovieRecommendationEntity {
  const MovieRecommendationModel(
      {required super.id, super.backDropPath});

  factory MovieRecommendationModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationModel(
          id: json['id'], backDropPath: json['backdrop_path']??'/ilpp1j0rF67uMiFnY33jTSfR5HM.jpg');
}
