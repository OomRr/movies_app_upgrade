import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_upgrade/core/services/payment_methods.dart';
import 'package:movies_upgrade/core/services/service_locator.dart';
import 'package:movies_upgrade/core/utilities/app_string.dart';
import 'package:movies_upgrade/series/presentation/components/on_air_component.dart';
import 'package:movies_upgrade/series/presentation/components/popular_series_component.dart';
import 'package:movies_upgrade/series/presentation/components/top_rated_series_component.dart';
import 'package:movies_upgrade/series/presentation/controller/series_bloc.dart';

class MainSeriesScreen extends StatelessWidget {
  const MainSeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TvOnAirComponent(),
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.popular,
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    /// TODO : NAVIGATION TO POPULAR SCREEN
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          AppString.seeMore,
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 16.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: TvPopularComponent()),
          Container(
            margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.topRated,
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    /// TODO : NAVIGATION TO Top Rated Movies Screen
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          AppString.seeMore,
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 16.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: TvTopRatedComponent()),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
