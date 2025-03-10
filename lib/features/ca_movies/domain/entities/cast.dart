import 'package:equatable/equatable.dart';

class Cast extends Equatable {

  const Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
  });

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String creditId;
  final int? order;
  final String? department;
  final String? job;

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        castId,
        character,
        creditId,
        order,
        department,
        job,
      ];
  // get fullProfilePath {
  //   if (profilePath != null) {
  //     return 'https://image.tmdb.org/t/p/w500$profilePath';
  //   }
  //   return 'https://i.stack.imgur.com/GNhxO.png';
  // }

  // factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));
  // factory Cast.fromMap(Map<String, dynamic> json) => Cast(
  //       adult: json["adult"],
  //       gender: json["gender"],
  //       id: json["id"],
  //       knownForDepartment: json["known_for_department"],
  //       name: json["name"],
  //       originalName: json["original_name"],
  //       popularity: json["popularity"].toDouble(),
  //       profilePath: json["profile_path"],
  //       castId: json["cast_id"],
  //       character: json["character"],
  //       creditId: json["credit_id"],
  //       order: json["order"],
  //       department: json["department"],
  //       job: json["job"],
  //     );

}
