import 'package:ca_movie_app/core/error/failures.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

import '../entities/cast.dart';


abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Cast>>> getCreditsResponse(int movieId);
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, Stream<List<Movie>>>> getSuggestionsByQuery(
    String searchTerm,
  );
}