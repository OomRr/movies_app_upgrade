import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_upgrade/core/utilities/enums.dart';
import 'package:movies_upgrade/series/presentation/controller/series_bloc.dart';

import '../../../core/network/api_constants.dart';
import '../../../core/services/payment_methods.dart';

class TvOnAirComponent extends StatelessWidget {
  const TvOnAirComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesState>(
      buildWhen: (previous, current) {
        return previous.onAirRequestState != current.onAirRequestState;
      },
      builder: (context, state) {
        switch (state.onAirRequestState!) {
          case RequestState.isLoaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: 400.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.onAirTvShows!.map((item) {
                  return GestureDetector(
                    key: const Key('openSeriesMinimalDetail'),
                    onTap: () {
                      /*  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return MovieDetailScreen(id: item.id);
                      },
                    ),
                  );*/
                    },
                    child: Stack(
                      children: [

                        SizedBox(
                          height: 400.0,
                          width: double.infinity,
                          child: ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.7, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              imageUrl: ApiConstants.imageUrl(item.backdropPath),
                              fit: BoxFit.cover,
                              // errorWidget: (context, url, error) => const Icon(Icons.error),
                              // placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentGeometry.topRight,
                          child:   IconButton(
                            onPressed: () {
                              initPaymentSheet(context: context, amount: 100);
                            },
                            icon: Icon(Icons.shopping_cart_checkout_outlined,color: Colors.white,),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.redAccent,
                                      size: 16.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'on air'.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  item.originalName,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          case RequestState.isLoading:
            return const SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.isError:
            return Center(child: Text(state.onAirErrorMessage!));
        }
      },
    );
  }
}
