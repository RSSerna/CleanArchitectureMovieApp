import 'dart:convert';

import 'package:ca_movie_app/features/ca_movies/data/models/cast_model.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/credits_response.dart';

class CreditsResponseModel extends CreditsResponse {
  const CreditsResponseModel({
    required int id,
    required List<CastModel> cast,
    required List<CastModel> crew,
  }) : super(id: id, cast: cast);

  factory CreditsResponseModel.fromJson(String str) =>
      CreditsResponseModel.fromMap(json.decode(str));

  factory CreditsResponseModel.fromMap(Map<String, dynamic> json) =>
      CreditsResponseModel(
        id: json["id"],
        cast:
            List<CastModel>.from(json["cast"].map((x) => CastModel.fromMap(x))),
        crew:
            List<CastModel>.from(json["crew"].map((x) => CastModel.fromMap(x))),
      );
}
