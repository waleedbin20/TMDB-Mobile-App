// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieUpcomingModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieUpcomingModel _$MovieUpcomingModelFromJson(Map<String, dynamic> json) =>
    MovieUpcomingModel(
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalResult: json['total_results'] as int?);

Map<String, dynamic> _$MovieUpcomingModelToJson(MovieUpcomingModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'totalResult': instance.totalResult
    };
