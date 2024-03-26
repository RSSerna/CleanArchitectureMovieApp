import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:ca_movie_app/core/error/failures.dart';
import 'package:ca_movie_app/core/usecases/usecase.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/cast.dart';
import 'package:ca_movie_app/features/ca_movies/domain/repositories/movie_repository.dart';

class GetCreditsResponse implements UseCase<List<Cast>, Params> {
  final MovieRepository repository;

  GetCreditsResponse({required this.repository});

  @override
  Future<Either<Failure, List<Cast>>> call(Params params) async {
    return await repository.getCreditsResponse(params.movieId);
  }
}

class Params extends Equatable {
  final int movieId;

  const Params({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}