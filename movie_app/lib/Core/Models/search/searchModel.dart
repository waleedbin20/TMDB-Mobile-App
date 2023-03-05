import 'package:movie_app/Core/Models/Movies/MovieDetails/movieDetails.dart';

class Search {
  final String? id;
  final String? name;
  MovieDetails? movieDetails;

  Search({this.id, this.name, this.movieDetails});
  factory Search.fromJson(json) {
    return Search(id: json['id'].toString(), name: json['name']);
  }
}

class SearchResult {
  final List<Search>? result;
  SearchResult({this.result});


  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      SearchResult(
      result: (json['results'] as List<dynamic>?)
          ?.map((e) => Search.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
}
