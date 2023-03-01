import 'dart:convert';

import 'package:movie_app/Core/Configs/MovieApiUrls.dart';
import 'package:movie_app/Core/Models/Movies/movieModel.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Core/Services/Movies/iMovieService.dart';

class MovieService implements IMovieService {
  MovieModelList? upcomingData;

  @override
  Future<List<dynamic>> getUpcomingMovies() async {
    const path =
        '${MovieApi.baseUrl}/movie/upcoming?api_key=${MovieApi.apiKey}';
    print(path);
    final response = await http.get(Uri.parse(path));

    if (response.statusCode == 200) {
      upcomingData =
          MovieModelList.fromJson(json.decode(response.body)['upcoming']);
      print(upcomingData!.movies);
      return [upcomingData!.movies];
    } else {
      throw Exception("No Upcoming founds");
    }
  }
}
