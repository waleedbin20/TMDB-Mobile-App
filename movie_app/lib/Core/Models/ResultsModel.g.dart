// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResultsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      posterPath: json['poster_path'] != null
          ? "https://image.tmdb.org/t/p/original" + json['poster_path']
          : "https://images.pexels.com/photos/4089658/pexels-photo-4089658.jpeg?cs=srgb&dl=pexels-victoria-borodinova-4089658.jpg&fm=jpg",
      adult: json['adult'] as bool?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as int?,
      originalTitle: json['original_title'] as String?,
      originalLanguage: json['original_language'] as String?,
      title: json['title'] as String?,
      backdropPath: json['backdrop_path'] != null
          ? "https://image.tmdb.org/t/p/original" + json['backdrop_path']
          : "https://images.pexels.com/photos/4089658/pexels-photo-4089658.jpeg?cs=srgb&dl=pexels-victoria-borodinova-4089658.jpg&fm=jpg",
      popularity: (json['popularity'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      video: json['video'] as bool?,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'posterPath': instance.posterPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'releaseDate': instance.releaseDate,
      'genreIds': instance.genreIds,
      'id': instance.id,
      'originalTitle': instance.originalTitle,
      'originalLanguage': instance.originalLanguage,
      'title': instance.title,
      'backdropPath': instance.backdropPath,
      'popularity': instance.popularity,
      'voteCount': instance.voteCount,
      'video': instance.video,
    };
