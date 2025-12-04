import 'package:dio/dio.dart';
import 'package:movies_upgrade/movie/data/model/movie_details_model.dart';
import 'package:movies_upgrade/movie/data/model/recommendation_model.dart';
import 'package:movies_upgrade/movie/domain/use_case/get_movie_details.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/error_message_model.dart';
import '../model/movie_model.dart';
import 'base_remote_movie_data_source.dart';

class RemoteMovieDataSource extends BaseRemoteMovieDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {

    final response = await Dio().get(
    //  'https://api.themoviedb.org/3/movie/now_playing?api_key=4426fa7f00b83dbf073bc7878e476731',
        ApiConstants.nowPlayingMoviesPath,
    /*  queryParameters: {

        'api_key': ApiConstants.apiKey,

      }*/
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {

    final response = await Dio().get(
      ApiConstants.popularMoviesPath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {

    final response = await Dio().get(
      ApiConstants.topRatedMoviesPath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters)async {

    final response = await Dio().get(
      ApiConstants.movieDetailsPath(parameters.id),
    );

    if (response.statusCode == 200) {
    return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieRecommendationModel>> getMovieRecommendations( parameters) async {
    final response = await Dio().get(
      ApiConstants.movieRecommendationsPath(parameters.id),
    );
    if (response.statusCode == 200) {
      return List<MovieRecommendationModel>.from((response.data['results'] as List)
          .map((e) => MovieRecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
