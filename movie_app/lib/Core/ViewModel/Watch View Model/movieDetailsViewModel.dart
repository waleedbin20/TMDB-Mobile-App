import 'package:movie_app/Core/Configs/enum.dart';
import 'package:movie_app/Core/Configs/routePath.dart';
import 'package:movie_app/Core/Models/Movies/MovieDetails/movieDetails.dart';
import 'package:movie_app/Core/Models/movieUpcomingModel.dart';
import 'package:movie_app/Core/Services/Movies/iMovieService.dart';
import 'package:movie_app/Core/Services/Navigation/iNavigationService.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsViewModel extends ReactiveViewModel {
  late MovieDetails? movieDetails;
}
