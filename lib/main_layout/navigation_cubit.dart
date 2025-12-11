import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_upgrade/movie/presentation/views/movies_screen.dart';
import 'package:movies_upgrade/series/presentation/views/series_screen.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  static NavigationCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [const MainMoviesScreen(), const MainSeriesScreen()];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(NavigationChangeBottomNavState());
  }
}
