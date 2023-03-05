import 'package:movie_app/Core/Configs/enum.dart';
import 'package:movie_app/Core/Configs/routePath.dart';
import 'package:movie_app/Core/Models/Movies/MovieDetails/movieDetails.dart';
import 'package:movie_app/Core/Models/movieUpcomingModel.dart';
import 'package:movie_app/Core/Models/search/searchModel.dart';
import 'package:movie_app/Core/Services/Movies/iMovieService.dart';
import 'package:movie_app/Core/Services/Navigation/iNavigationService.dart';
import 'package:stacked/stacked.dart';
import 'package:tuple/tuple.dart';

import '../../Models/Genres.dart';

class SearchViewModel extends ReactiveViewModel {
  final _genres = GenresList.fromJson(genreslist).list;

  final IMovieService? movieService;
  final INavigationService _navigationService;

  SearchViewModel(this.movieService, this._navigationService);

  MovieUpcomingModel? _searchResult;

  MovieUpcomingModel? get searchResult => _searchResult;

  List<Genres> get genres => _genres;

  Future<MovieUpcomingModel?> getSearchQuery(String query) async {
    setBusy(true);
    _searchResult = await movieService!.searchMovie(query);
    setBusy(false);
  }

  Future<void> openSearchResultDetails(String query) async {
    await getSearchQuery(query);
    final arguments = Tuple2<MovieUpcomingModel?, NavigationFlow?>(
        _searchResult, NavigationFlow.Default);
    await _navigationService.pushNamed(RoutePaths.searchResult,
        arguments: arguments, navigationFlow: NavigationFlow.Default);
  }
}
