// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromMap(jsonString);


import 'package:ca_movie_app/features/ca_movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class NowPlayingResponse extends Equatable {
  const NowPlayingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final Dates dates;
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  @override
  List<Object?> get props => [
        dates,
        page,
        results,
        totalPages,
        totalResults,
      ];

  // factory NowPlayingResponse.fromJson(String str) => NowPlayingResponse.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  // factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
  //     dates: Dates.fromMap(json["dates"]),
  //     page: json["page"],
  //     results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
  //     totalPages: json["total_pages"],
  //     totalResults: json["total_results"],
  // );

  // Map<String, dynamic> toMap() => {
  //     "dates": dates.toMap(),
  //     "page": page,
  //     "results": List<dynamic>.from(results.map((x) => x.toMap())),
  //     "total_pages": totalPages,
  //     "total_results": totalResults,
  // };
}

class Dates extends Equatable {
  
  const Dates({
    required this.maximum,
    required this.minimum,
  });

  final DateTime maximum;
  final DateTime minimum;

  @override
  List<Object?> get props => [maximum, minimum];

  // factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  // factory Dates.fromMap(Map<String, dynamic> json) => Dates(
  //       maximum: DateTime.parse(json["maximum"]),
  //       minimum: DateTime.parse(json["minimum"]),
  //     );

  // Map<String, dynamic> toMap() => {
  //     "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
  //     "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
  // };
}
