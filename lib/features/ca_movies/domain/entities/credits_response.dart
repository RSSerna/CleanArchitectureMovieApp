// To parse this JSON data, do
//
//     final creditsResponse = creditsResponseFromMap(jsonString);

import 'package:ca_movie_app/features/ca_movies/domain/entities/cast.dart';
import 'package:equatable/equatable.dart';

class CreditsResponse extends Equatable {
  const CreditsResponse({
    required this.id,
    required this.cast,
  });

  final int id;
  final List<Cast> cast;

  @override

  List<Object?> get props => [id, cast, ];//crew];

  // factory CreditsResponse.fromJson(String str) =>
  //     CreditsResponse.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  // factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
  //       id: json["id"],
  //       cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
  //       // crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
  //     );

  // Map<String, dynamic> toMap() => {
  //     "id": id,
  //     "cast": List<dynamic>.from(cast.map((x) => x.toMap())),
  // };
}
