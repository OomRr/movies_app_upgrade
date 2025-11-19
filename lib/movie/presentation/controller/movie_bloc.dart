import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_upgrade/core/usecase/base_use_case.dart';
import 'package:movies_upgrade/core/utilities/enums.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_now_playing_movies_use_case.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_popular_movies_use_case.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_top_rated_movies_use_case.dart';
import 'package:movies_upgrade/movie/presentation/controller/bloc_event.dart';
import 'package:movies_upgrade/movie/presentation/controller/bloc_state.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase(const NoParameter());
      //  print(result);
      result.fold(
          (l) => emit(state.copyWith(
              nowPlayingState: RequestState.isError,
              nowPlayingMessage: l.errorMessage)),
          (r) => emit(state.copyWith(
              nowPlayingState: RequestState.isLoaded, nowPlayingMovies: r)));
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase(const NoParameter());
      //  print(result);
      result.fold(
          (l) => emit(state.copyWith(
              popularState: RequestState.isError,
              popularMessage: l.errorMessage)),
          (r) => emit(state.copyWith(
                popularMovies: r,
                popularState: RequestState.isLoaded,
              )));
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase(const NoParameter());
      result.fold(
          (l) => emit(state.copyWith(
              topRatedState: RequestState.isError,
              topRatedMessage: l.errorMessage)),
          (r) => emit(state.copyWith(
                topRatedMovies: r,
                topRatedState: RequestState.isLoaded,
              )));
    });
  }
}
