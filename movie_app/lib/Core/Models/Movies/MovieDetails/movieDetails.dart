import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/Core/Models/Movies/MovieDetails/Genre.dart';
import 'package:movie_app/Core/Models/formattedMonthGenerator.dart';

part 'movieDetails.g.dart';

@JsonSerializable()
class MovieDetails {
  String? backdropPath;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  String? overview;

  String? releaseDate;

  String? title;
  bool? video;

  String? trailerId;

  MovieDetails(
      {this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.releaseDate,
      this.title,
      this.video,
      this.trailerId});

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}
