// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromMap(jsonString);

import 'dart:convert';

import 'package:ca_movie_app/core/constants/constants.dart';
import 'package:ca_movie_app/features/ca_movies/data/models/models.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/now_playing_response.dart';

class NowPlayingResponseModel extends NowPlayingResponse {
  const NowPlayingResponseModel({
    required DatesModel dates,
    required int page,
    required List<MovieModel> results,
    required int totalPages,
    required int totalResults,
  }) : super(
          dates: dates,
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory NowPlayingResponseModel.fromJson(String str) =>
      NowPlayingResponseModel.fromMap(json.decode(str));

  factory NowPlayingResponseModel.fromMap(Map<String, dynamic> json) =>
      NowPlayingResponseModel(
        dates: DatesModel.fromMap(json["dates"]),
        page: json["page"],
        results: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromMap(x, Constants.nowPlayingHeroId))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
  // String toJson() => json.encode(toMap());

  // Map<String, dynamic> toMap() => {
  //     "dates": dates.toMap(),
  //     "page": page,
  //     "results": List<dynamic>.from(results.map((x) => x.toMap())),
  //     "total_pages": totalPages,
  //     "total_results": totalResults,
  // };
}

class DatesModel extends Dates {
  const DatesModel({
    required DateTime maximum,
    required DateTime minimum,
  }) : super(
          maximum: maximum,
          minimum: minimum,
        );

  factory DatesModel.fromJson(String str) =>
      DatesModel.fromMap(json.decode(str));

  factory DatesModel.fromMap(Map<String, dynamic> json) => DatesModel(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  // String toJson() => json.encode(toMap());

  // Map<String, dynamic> toMap() => {
  //     "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
  //     "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
  // };
}
