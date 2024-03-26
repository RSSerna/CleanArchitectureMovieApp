// To parse this JSON data, do
//
//     final searchMovieResponse = searchMovieResponseFromMap(jsonString);

import 'dart:convert';

import 'package:ca_movie_app/core/constants/constants.dart';
import 'package:ca_movie_app/features/ca_movies/data/models/models.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/search_movie_response.dart';

class SearchMovieResponseModel extends SearchMovieResponse {
  const SearchMovieResponseModel({
    required int page,
    required List<MovieModel> results,
    required int totalPages,
    required int totalResults,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory SearchMovieResponseModel.fromJson(String str) =>
      SearchMovieResponseModel.fromMap(json.decode(str));

  factory SearchMovieResponseModel.fromMap(Map<String, dynamic> json) =>
      SearchMovieResponseModel(
        page: json["page"],
        results: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromMap(x,Constants.searchHeroId))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
      
  // String toJson() => json.encode(toMap());

  // Map<String, dynamic> toMap() => {
  //     "page": page,
  //     "results": List<dynamic>.from(results.map((x) => x.toMap())),
  //     "total_pages": totalPages,
  //     "total_results": totalResults,
  // };
}
