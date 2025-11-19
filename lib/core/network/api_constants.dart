class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = '4426fa7f00b83dbf073bc7878e476731';
  static const String nowPlayingMoviesPath =
      '${baseUrl}movie/now_playing?api_key=$apiKey';
  static const String topRatedMoviesPath =
      '${baseUrl}movie/top_rated?api_key=$apiKey';
  static const String popularMoviesPath =
      '${baseUrl}movie/popular?api_key=$apiKey';

  static String movieDetailsPath(movieId) =>
      '${baseUrl}movie/$movieId?api_key=$apiKey';
  static String movieRecommendationsPath(movieId) =>
      '${baseUrl}movie/$movieId/recommendations?api_key=$apiKey';


  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String? path) =>path!=null? baseImageUrl + path:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8bUqIUkfyesCXuAFw-MFLebEI-5to1ouplw&s';
}
