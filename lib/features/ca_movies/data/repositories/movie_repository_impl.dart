import 'package:dartz/dartz.dart';

import 'package:ca_movie_app/core/error/exceptions.dart';
import 'package:ca_movie_app/core/error/failures.dart';
import 'package:ca_movie_app/core/network/network_info.dart';
import 'package:ca_movie_app/features/ca_movies/data/datasources/movie_remote_data_resource.dart';


import 'package:ca_movie_app/features/ca_movies/domain/entities/cast.dart';

import 'package:ca_movie_app/features/ca_movies/domain/entities/movie.dart';

import 'package:ca_movie_app/features/ca_movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl({
    required this.movieRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    networkInfo.isConnected;
    try {
      final nowPlayingMovies =
          await movieRemoteDataSource.getNowPlayingMovies();
      return Right(nowPlayingMovies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    networkInfo.isConnected;
    try {
      final popularMovies = await movieRemoteDataSource.getPopularMovies();
      return Right(popularMovies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Cast>>> getCreditsResponse(int movieId) async {
    networkInfo.isConnected;
    try {
      final creditsResponse =
          await movieRemoteDataSource.getCreditsResponse(movieId);
      return Right(creditsResponse);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Stream<List<Movie>>>> getSuggestionsByQuery(
      String searchTerm) async {
    networkInfo.isConnected;
    try {
      final suggestions =
          movieRemoteDataSource.getSuggestionsByQuery(searchTerm);
      return Right(suggestions);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    networkInfo.isConnected;
    try {
      final searchedMovies = await movieRemoteDataSource.searchMovies(query);
      return Right(searchedMovies);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}