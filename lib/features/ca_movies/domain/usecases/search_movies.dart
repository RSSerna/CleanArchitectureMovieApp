import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:ca_movie_app/features/ca_movies/domain/entities/movie.dart';
import 'package:ca_movie_app/core/error/failures.dart';
import 'package:ca_movie_app/core/usecases/usecase.dart';
import 'package:ca_movie_app/features/ca_movies/domain/repositories/movie_repository.dart';

class SearchMovies implements UseCase<List<Movie>, Params> {
  final MovieRepository repository;

  SearchMovies({required this.repository});

  @override
  Future<Either<Failure, List<Movie>>> call(Params params) async {
    return await repository.searchMovies(params.query);
  }
}

class Params extends Equatable {
  final String query;

  const Params({required this.query});

  @override
  List<Object?> get props => [query];
}
