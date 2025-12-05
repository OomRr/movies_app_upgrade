import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_upgrade/core/utilities/enums.dart';
import 'package:movies_upgrade/series/presentation/controller/series_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constants.dart';
import '../../../core/utilities/widgets.dart';

class TvPopularComponent extends StatelessWidget {
  const TvPopularComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesState>(
      buildWhen: (previous, current) =>
          previous.popularRequestState != current.popularRequestState,
      builder: (context, state) {
        switch (state.popularRequestState!) {
          case RequestState.isLoaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularTvShows!.length,
                  itemBuilder: (context, index) {
                    final tvShow = state.popularTvShows![index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /*Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return MovieDetailScreen(id: movie.id);
                              },
                            ),
                          );*/
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstants.imageUrl(tvShow.backdropPath),
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
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.isLoading:
            return shimmer2();
           // return const Center(child: CircularProgressIndicator());
          case RequestState.isError:
            return Center(child: Text(state.popularErrorMessage!));
        }
      },
    );
  }
}
