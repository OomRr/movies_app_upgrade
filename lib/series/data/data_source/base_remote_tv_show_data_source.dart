import 'package:movies_upgrade/series/data/model/tv_show_model.dart';

abstract class BaseRemoteTvShowDataSource {
  Future<List<TvShowModel>> getOnAirTvShow();

  Future<List<TvShowModel>> getPopularTvShow();

  Future<List<TvShowModel>> getTopRatedTvShow();

  // Future<List<TvShowModel>> getDetailsTvShow();
}
