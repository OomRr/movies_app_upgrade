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
import 'package:movies_upgrade/series/data/data_repo/data_repo.dart';
import 'package:movies_upgrade/series/data/data_source/base_remote_tv_show_data_source.dart';
import 'package:movies_upgrade/series/data/data_source/remote_tv_show_data_source.dart';
import 'package:movies_upgrade/series/domain/domain_repo/base_tv_repo.dart';
import 'package:movies_upgrade/series/domain/use_case/tv_on_air_usecase.dart';
import 'package:movies_upgrade/series/domain/use_case/tv_popular_usecase.dart';
import 'package:movies_upgrade/series/domain/use_case/tv_top_rated_usecase.dart';
import 'package:movies_upgrade/series/presentation/controller/series_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //////////////////////////////////////MOVIES PART///////////////////////////////////////////////////

    /// TODO : Bloc object
    /// registerFactory for rebuilding the screen every time u visit is to stay up to date
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));

    sl.registerFactory(
      () => MovieDetailsBloc(
        getMovieDetailsUseCase: sl(),
        getMovieRecommendationsUseCase: sl(),
      ),
    );

    /// TODO : useCase object for movies
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieRecommendationsUseCase(sl()));

    /// TODO : repo object
    sl.registerLazySingleton<BaseMovieRepo>(() => MovieRepo(sl()));

    /// TODO : dataSource object

    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
      () => RemoteMovieDataSource(),
    );
    //////////////////////////////////////SERIES PART///////////////////////////////////////////////////
    //series Bloc
    sl.registerFactory(
      () => SeriesBloc(
        tvOnAirUseCase: sl(),
        tvPopularUseCase: sl(),
        tvTopRatedUseCase: sl(),
      ),
    );
    //use cases objects
    sl.registerLazySingleton(() => TvOnAirUseCase(sl()));
    sl.registerLazySingleton(() => TvPopularUseCase(sl()));
    sl.registerLazySingleton(() => TvTopRatedUseCase(sl()));
    //repository object
    sl.registerLazySingleton<BaseTvShowRepo>(
      () => TvShowRepository(baseRemoteTvShowDataSource: sl()),
    );
    //dataSource object
    sl.registerLazySingleton<BaseRemoteTvShowDataSource>(
      () => RemoteTvShowDataSource(),
    );
  }
}
