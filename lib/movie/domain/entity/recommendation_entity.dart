import 'package:equatable/equatable.dart';

class MovieRecommendationEntity extends Equatable {
  final int id;
  final String? backDropPath;

  const MovieRecommendationEntity({required this.id,this.backDropPath});

  @override
  List<Object?> get props => [id, backDropPath];
}
