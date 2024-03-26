import 'package:ca_movie_app/features/ca_movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class PopularResponse extends Equatable {
  const PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];

  // factory PopularResponse.fromJson(String str) => PopularResponse.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  // factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
  //     page: json["page"],
  //     results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
  //     totalPages: json["total_pages"],
  //     totalResults: json["total_results"],
  // );

  // Map<String, dynamic> toMap() => {
  //     "page": page,
  //     "results": List<dynamic>.from(results.map((x) => x.toMap())),
  //     "total_pages": totalPages,
  //     "total_results": totalResults,
  // };
}
