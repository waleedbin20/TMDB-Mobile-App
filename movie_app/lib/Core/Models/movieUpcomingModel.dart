import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/Core/Models/ResultsModel.dart';

part 'movieUpcomingModel.g.dart';

@JsonSerializable()
class MovieUpcomingModel {
  List<Results>? results;

  MovieUpcomingModel({
    this.results,
  });

  factory MovieUpcomingModel.fromJson(Map<String, dynamic> json) =>
      _$MovieUpcomingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieUpcomingModelToJson(this);

  
}
