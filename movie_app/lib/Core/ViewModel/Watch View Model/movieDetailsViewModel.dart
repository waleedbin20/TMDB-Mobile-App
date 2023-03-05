import 'package:movie_app/Core/Models/Movies/MovieDetails/movieDetails.dart';

import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsViewModel extends ReactiveViewModel {
  late MovieDetails? movieDetails;

  Future<void> playVideo(String? youTubeId) async {
    await launchUrl(Uri.parse('https://www.youtube.com/embed/$youTubeId'));
  }
}
