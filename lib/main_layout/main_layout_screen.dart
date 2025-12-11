import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_upgrade/movie/presentation/controller/movie_bloc.dart';
import 'package:movies_upgrade/series/presentation/controller/series_bloc.dart';

import '../core/services/service_locator.dart';
import '../movie/presentation/controller/bloc_event.dart';
import 'navigation_cubit.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //create: (context) => (),
      providers: [
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(
          create: (BuildContext context) => sl<MovieBloc>()
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
        ),
        BlocProvider(
          create: (context) => sl<SeriesBloc>()
            ..add(GetOnAirTvShowEvent())
            ..add(GetPopularTvShowEvent())
            ..add(GetTopRatedTvShowEvent()),
        ),
      ],
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          var cubit = NavigationCubit.get(context);
          return Scaffold(

            body: cubit.screens[cubit.currentIndex],
            floatingActionButton: Padding(

              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),


                child: BottomNavigationBar(
                  type: BottomNavigationBarType.shifting,
                  selectedItemColor: Colors.blue,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.movie_creation_outlined),
                      label: 'Movies',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.tv_outlined),
                      label: 'TV Shows',
                    ),
                  ],

                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottomNav(index);
                  },
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
