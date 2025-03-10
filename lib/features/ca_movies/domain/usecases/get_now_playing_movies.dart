import 'package:dartz/dartz.dart';

import 'package:ca_movie_app/core/error/failures.dart';
import 'package:ca_movie_app/core/usecases/usecase.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/movie.dart';
import 'package:ca_movie_app/features/ca_movies/domain/repositories/movie_repository.dart';

class GetNowPlayingMovies implements UseCase<List<Movie>, NoParams> {
  final MovieRepository repository;

  GetNowPlayingMovies({required this.repository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams noParams) async {
    return await repository.getNowPlayingMovies();
  }
}