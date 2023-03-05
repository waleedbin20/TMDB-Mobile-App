import 'package:movie_app/Core/Models/Movies/MovieDetails/movieDetails.dart';
import 'package:movie_app/Core/Models/movieUpcomingModel.dart';
import 'package:movie_app/Core/Models/search/searchModel.dart';

abstract class IMovieService {
  Future<MovieUpcomingModel?> getUpcomingMovies();
  Future<MovieDetails?> getMovieDetails(String movieId);
  Future<MovieUpcomingModel?> searchMovie(String searchWord);
}
