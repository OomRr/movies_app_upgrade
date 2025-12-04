import 'package:dio/dio.dart';
import 'package:movies_upgrade/core/error/exceptions.dart';
import 'package:movies_upgrade/core/network/api_constants.dart';
import 'package:movies_upgrade/core/network/error_message_model.dart';
import 'package:movies_upgrade/series/data/model/tv_show_model.dart';

import 'base_remote_tv_show_data_source.dart';

class RemoteTvShowDataSource implements BaseRemoteTvShowDataSource {
  @override
  Future<List<TvShowModel>> getOnAirTvShow() async {
    final response = await Dio().get(ApiConstants.onAirTvPath);
    return response.statusCode == 200
        ? (List<TvShowModel>.from(
            (response.data['results'] as List).map(
              (e) => TvShowModel.fromJson(e),
            ),
          ))
        : throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data),
          );

    // return response.data['results'].map<TvShowModel>((json) =>
    // TvShowModel.fromJson(json)).toList();
  }

  @override
  Future<List<TvShowModel>> getPopularTvShow() async {
    final response = await Dio().get(ApiConstants.popularTvPath);
    return response.statusCode == 200
        ? List<TvShowModel>.from(
            (response.data['results'] as List).map(
              (e) => TvShowModel.fromJson(e),
            ),
          )
        : throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data),
          );
  }

  @override
  Future<List<TvShowModel>> getTopRatedTvShow() async {
    final response = await Dio().get(ApiConstants.topRatedTvPath);
    return response.statusCode == 200
        ? List<TvShowModel>.from(
            (response.data['results'] as List).map(
              (e) => TvShowModel.fromJson(e),
            ),
          )
        : throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data),
          );
  }

  /* 
  @override
  Future<List<TvShowModel>> getDetailsTvShow()async {
    final response = await Dio().get(ApiConstants.detailsTvPath);
    return response.statusCode == 200
        ? List<TvShowModel>.from(
      (response.data['results'] as List).map(
            (e) => TvShowModel.fromJson(e),
      ),
    )
        : throw ServerException(
      errorMessageModel: ErrorMessageModel.fromJson(response.data),
    );
  } */
}
