import 'package:movies_upgrade/series/data/model/series_details_model.dart';
import 'package:movies_upgrade/series/data/model/series_recommendation_model.dart';
import 'package:movies_upgrade/series/data/model/tv_show_model.dart';

abstract class BaseRemoteTvShowDataSource {
  Future<List<TvShowModel>> getOnAirTvShow();
  Future<List<TvShowModel>> getPopularTvShow();
  Future<List<TvShowModel>> getTopRatedTvShow();
  Future<SeriesDetailsModel> getTvShowDetails(int id);
  Future<List<SeriesRecommendationModel>> getTvShowRecommendations(int id);
  // Future<List<TvShowModel>> getDetailsTvShow();
}
