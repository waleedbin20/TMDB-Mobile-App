import 'package:json_annotation/json_annotation.dart';

// part 'results.g.dart';

@JsonSerializable()
class Results {
  final String? posterPath;
  final bool? adult;
  final String? overview;
  final String? releaseDate;
  final List<int>? genreIds;
  final int? id;
  final String? originalTitle;
  final String? originalLanguage;
  final String? title;
  final String? backdropPath;
  final double? popularity;
  final int? voteCount;
  final bool? video;
  final double? voteAverage;

  Results(
      {this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.genreIds,
      this.id,
      this.originalTitle,
      this.originalLanguage,
      this.title,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage});

  // factory Results.fromJson(Map<String, dynamic> json) =>
  //     _$ResultsFromJson(json);

  // Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
