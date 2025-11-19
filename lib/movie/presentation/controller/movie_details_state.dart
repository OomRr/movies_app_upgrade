part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final RequestState movieDetailsState;
  final MovieDetailsEntity? movieDetailsEntity;
  final String? movieDetailsErrorMessage;
  final RequestState movieRecommendationState;
  final List<MovieRecommendationEntity> movieRecommendationEntitys;
  final String? movieRecommendationErrorMessage;

  const MovieDetailsState(
      {this.movieRecommendationState = RequestState.isLoading,
      this.movieRecommendationEntitys = const [],
      this.movieRecommendationErrorMessage,
      this.movieDetailsState = RequestState.isLoading,
       this.movieDetailsEntity,
      this.movieDetailsErrorMessage});

  MovieDetailsState copyWith({
    RequestState? movieDetailsState,
    MovieDetailsEntity? movieDetailsEntity,
    String? movieDetailsErrorMessage,
    RequestState? movieRecommendationState,
    String? movieRecommendationErrorMessage,
    List<MovieRecommendationEntity>? movieRecommendationEntitys,
  }) {
    return MovieDetailsState(
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsEntity: movieDetailsEntity ?? this.movieDetailsEntity,
        movieDetailsErrorMessage:
            movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
        movieRecommendationState:
            movieRecommendationState ?? this.movieRecommendationState,
        movieRecommendationEntitys:
            movieRecommendationEntitys ?? this.movieRecommendationEntitys,
        movieRecommendationErrorMessage: movieRecommendationErrorMessage ??
            this.movieRecommendationErrorMessage);
  }

  @override
  List<Object?> get props => [
        movieDetailsState,
        movieDetailsEntity,
        movieDetailsErrorMessage,
        movieRecommendationState,
        movieRecommendationEntitys,
        movieRecommendationErrorMessage,
      ];
}
