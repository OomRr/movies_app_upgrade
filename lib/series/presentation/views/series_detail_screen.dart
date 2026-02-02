import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movies_upgrade/core/network/api_constants.dart';
import 'package:movies_upgrade/core/services/service_locator.dart';
import 'package:movies_upgrade/core/utilities/enums.dart';
import 'package:movies_upgrade/movie/domain/entity/genres_entity.dart';
import 'package:movies_upgrade/series/presentation/controller/series_details_bloc.dart';
import 'package:movies_upgrade/series/presentation/controller/series_details_event.dart';
import 'package:movies_upgrade/series/presentation/controller/series_details_state.dart';

class SeriesDetailScreen extends StatelessWidget {
  final int id;

  const SeriesDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SeriesDetailsBloc>()
        ..add(GetSeriesDetailsEvent(id))
        ..add(GetSeriesRecommendationsEvent(id)),
      lazy: false,
      child: const Scaffold(body: SeriesDetailContent()),
    );
  }
}

class SeriesDetailContent extends StatelessWidget {
  const SeriesDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesDetailsBloc, SeriesDetailsState>(
      builder: (context, state) {
        switch (state.seriesDetailsState) {
          case RequestState.isLoading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.isError:
            return Text(state.seriesDetailsErrorMessage!);
          case RequestState.isLoaded:
            return CustomScrollView(
              key: const Key('seriesDetailScrollView'),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black,
                              Colors.black,
                              Colors.black,
                              Colors.black,
                            ],
                            stops: [0.0, 1.0, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: ApiConstants.imageUrl(
                            state.seriesDetailsEntity!.backdropPath,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.seriesDetailsEntity!.name,
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  state.seriesDetailsEntity!.firstAirDate.split(
                                    '-',
                                  )[0],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    (state.seriesDetailsEntity!.voteAverage / 2)
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    '(${state.seriesDetailsEntity!.voteAverage})',
                                    style: const TextStyle(
                                      fontSize: 1.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16.0),
                              Text(
                                '${state.seriesDetailsEntity!.numberOfSeasons} Seasons',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            state.seriesDetailsEntity!.overview,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Genres: ${_showGenres(state.seriesDetailsEntity!.genres)}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        'More like this'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: _showRecommendations(),
                ),
              ],
            );
          case RequestState.isError:
            return Center(child: Text(state.seriesDetailsErrorMessage!));
        }
      },
    );
  }

  String _showGenres(List<GenresEntity> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  Widget _showRecommendations() {
    return BlocBuilder<SeriesDetailsBloc, SeriesDetailsState>(
      builder: (context, state) {
        switch (state.seriesRecommendationState) {
          case RequestState.isLoading:
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.isLoaded:
            return SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final recommendation = state.seriesRecommendationEntitys[index];
                return FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return SeriesDetailScreen(id: recommendation.id);
                          },
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: ApiConstants.imageUrl(
                          recommendation.backDropPath!,
                        ),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            height: 170.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        height: 180.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }, childCount: state.seriesRecommendationEntitys.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
                crossAxisCount: 3,
              ),
            );
          case RequestState.isError:
            return SliverToBoxAdapter(
              child: Center(
                child: Text(state.seriesRecommendationErrorMessage!),
              ),
            );
        }
      },
    );
  }
}
