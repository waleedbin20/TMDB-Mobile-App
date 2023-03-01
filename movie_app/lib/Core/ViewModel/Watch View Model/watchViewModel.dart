import 'package:movie_app/Core/Models/Movies/movieModel.dart';
import 'package:movie_app/Core/Services/Movies/iMovieService.dart';
import 'package:stacked/stacked.dart';

class WatchViewModel extends ReactiveViewModel {
  IMovieService? _iMovieService;

  WatchViewModel(this._iMovieService);
  MovieUpcomingModel? movieUpcomingModel;

  @override
  Future<MovieUpcomingModel> getUpcomingMovies() async {
    movieUpcomingModel =
        (await _iMovieService?.getUpcomingMovies()) as MovieUpcomingModel?;
    return movieUpcomingModel!;
  }
}
