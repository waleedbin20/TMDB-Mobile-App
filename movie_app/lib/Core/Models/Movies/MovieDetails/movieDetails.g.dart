// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
      homepage: json['homepage'] as String?,
      id: json['id'] as int?,
      imdbId: json['imdb_id'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] != null
          ? FormattedMonthGenerator.getFormattedDate(
              json['release_date'] as String)
          : null,
      title: json['title'] as String?,
      video: json['video'] as bool?,
    )
      ..backdropPath = json['backdrop_path'] as String?
      ..posterPath = json['poster_path'] != null
          ? "https://image.tmdb.org/t/p/original" + json['poster_path']
          : "https://images.pexels.com/photos/4089658/pexels-photo-4089658.jpeg?cs=srgb&dl=pexels-victoria-borodinova-4089658.jpg&fm=jpg"
      ..genres = (json['genres'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MovieDetailsToJson(MovieDetails instance) =>
    <String, dynamic>{
      'backdropPath': instance.backdropPath,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdbId': instance.imdbId,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'posterPath': instance.posterPath,
      'overview': instance.overview,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
    };
