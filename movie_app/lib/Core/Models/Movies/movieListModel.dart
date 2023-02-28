import 'package:movie_app/Core/Models/Movies/dates.dart';
import 'package:movie_app/Core/Models/Movies/results.dart';

import 'package:json_annotation/json_annotation.dart';

// part 'movieLists.g.dart';

@JsonSerializable()
class MovieList {
  final int? page;
  final List<Results>? results;
  final Dates? dates;
  final int? totalPages;
  final int? totalResults;

  MovieList(
      {this.page,
      this.results,
      this.dates,
      this.totalPages,
      this.totalResults});

  // factory MovieList.fromJson(Map<String, dynamic> json) =>
  //     _$MovieListFromJson(json);

  // Map<String, dynamic> toJson() => _$MovieListToJson(this);   
}
