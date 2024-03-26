import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:ca_movie_app/core/error/failures.dart';
import 'package:ca_movie_app/core/usecases/usecase.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/movie.dart';
import 'package:ca_movie_app/features/ca_movies/domain/repositories/movie_repository.dart';



class GetSuggestionsByQuery implements UseCase<Stream<List<Movie>>, Params> {
  final MovieRepository repository;

  GetSuggestionsByQuery({required this.repository});

  @override
  Future<Either<Failure, Stream<List<Movie>>>> call(Params params) async {
    return await repository.getSuggestionsByQuery(params.query);
  }
}

class Params extends Equatable {
  final String query;

  const Params({required this.query});

  @override
  List<Object?> get props => [query];
}