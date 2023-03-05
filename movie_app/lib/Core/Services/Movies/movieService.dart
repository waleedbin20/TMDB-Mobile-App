import 'dart:convert';

import 'package:movie_app/Core/Configs/MovieApiUrls.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Core/Models/Movies/MovieDetails/movieDetails.dart';
import 'package:movie_app/Core/Models/movieUpcomingModel.dart';
import 'package:movie_app/Core/Services/Movies/iMovieService.dart';

class MovieService implements IMovieService {
  MovieUpcomingModel? _movieUpcomingModel;

  MovieDetails? _movieDetails;

  @override
  Future<MovieUpcomingModel?> getUpcomingMovies() async {
    const path =
        '${MovieApi.baseUrl}/movie/upcoming?api_key=${MovieApi.apiKey}';
    final response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      _movieUpcomingModel =
          MovieUpcomingModel.fromJson(json.decode(response.body));
      return _movieUpcomingModel;
    } else {
      throw Exception("No Upcoming founds");
    }
  }

  @override
  Future<MovieDetails?> getMovieDetails(String movieId) async {
    var path = '${MovieApi.baseUrl}/movie/$movieId?api_key=${MovieApi.apiKey}';
    final response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      _movieDetails = MovieDetails.fromJson(json.decode(response.body));
      return _movieDetails;
    } else {
      throw Exception("No Upcoming founds");
    }
  }
}
