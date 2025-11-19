import 'package:get_it/get_it.dart';
import 'package:movies_upgrade/movie/data/data_repo/movie_repo.dart';
import 'package:movies_upgrade/movie/data/data_source/base_remote_movie_data_source.dart';
import 'package:movies_upgrade/movie/data/data_source/remote_movie_data_source.dart';
import 'package:movies_upgrade/movie/domain/domain_repo/base_movie_repo.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_movie_details.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_now_playing_movies_use_case.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_popular_movies_use_case.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_recommendations.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_top_rated_movies_use_case.dart';
import 'package:movies_upgrade/movie/presentation/controller/movie_bloc.dart';
import 'package:movies_upgrade/movie/presentation/controller/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// TODO : Bloc object
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(
        getMovieDetailsUseCase: sl(), getMovieRecommendationsUseCase: sl()));

    /// TODO : useCase object
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieRecommendationsUseCase(sl()));

    /// TODO : repo object
    sl.registerLazySingleton<BaseMovieRepo>(() => MovieRepo(sl()));

    /// TODO : dataSource object

    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => RemoteMovieDataSource());
  }
}
