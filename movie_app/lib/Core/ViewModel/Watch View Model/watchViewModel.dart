import 'package:movie_app/Core/Configs/enum.dart';
import 'package:movie_app/Core/Configs/routePath.dart';
import 'package:movie_app/Core/Models/Movies/MovieDetails/movieDetails.dart';
import 'package:movie_app/Core/Models/movieUpcomingModel.dart';
import 'package:movie_app/Core/Services/Movies/iMovieService.dart';
import 'package:movie_app/Core/Services/Navigation/iNavigationService.dart';
import 'package:stacked/stacked.dart';
import 'package:tuple/tuple.dart';

class WatchViewModel extends ReactiveViewModel {
  final IMovieService? _movieService;
  final INavigationService _navigationService;

  WatchViewModel(this._movieService, this._navigationService);

  MovieUpcomingModel? _movies;

  MovieUpcomingModel? get movies => _movies;

  MovieDetails? _movieDetails;

  MovieDetails? get movieDetails => _movieDetails;

  Future<void> fetchMovies() async {
    setBusy(true);
    _movies = await _movieService!.getUpcomingMovies();
    setBusy(false);
  }

  Future<void> getMovieDetails(String movieId) async {
    setBusy(true);
    _movieDetails = await _movieService!.getMovieDetails(movieId);
    setBusy(false);
  }

  Future<void> openMovieDetails(String movieId) async {
    await getMovieDetails(movieId);
    final arguments = Tuple2<MovieDetails?, NavigationFlow?>(
        _movieDetails, NavigationFlow.Default);
    await _navigationService.pushNamed(RoutePaths.movieDetails,
        arguments: arguments, navigationFlow: NavigationFlow.Default);
  }

  Future<void> openSearch() async {
    await _navigationService.pushNamed(RoutePaths.search,
        arguments: NavigationFlow.Watch);
  }
}
