import 'package:equatable/equatable.dart';

class SeriesRecommendationEntity extends Equatable {
  final int id;
  final String? backDropPath;

  const SeriesRecommendationEntity({required this.id, this.backDropPath});

  @override
  List<Object?> get props => [id, backDropPath];
}
