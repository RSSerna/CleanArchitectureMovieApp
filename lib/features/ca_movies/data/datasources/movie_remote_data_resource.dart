import 'dart:async';

import 'package:ca_movie_app/core/error/exceptions.dart';
import 'package:ca_movie_app/core/helpers/debouncer.dart';

import 'package:ca_movie_app/features/ca_movies/data/models/models.dart';
import 'package:http/http.dart' as http;



abstract class MovieRemoteDataSource {
  /// Calls the http://api.themoviedb.org/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getNowPlayingMovies();

  /// Calls the http://api.themoviedb.org/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> getPopularMovies();

  /// Calls the http://api.themoviedb.org/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<CastModel>> getCreditsResponse(int movieId);

  /// Calls the http://api.themoviedb.org/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<MovieModel>> searchMovies(String query);

  /// Calls the http://api.themoviedb.org/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Stream<List<MovieModel>> getSuggestionsByQuery(String searchTerm);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;
  final String _apiKey = 'd2b9fff2c64df549c7232718ac2b77e3';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'en-US';

  List<MovieModel> onDisplayMovies = [];
  List<MovieModel> nowPopularMovies = [];
  Map<int, List<CastModel>> moviesCast = {};
  int _popularPage = 0;
  final StreamController<List<MovieModel>> _suggestionsStreamController =
      StreamController.broadcast();

  Stream<List<MovieModel>> get suggestionStream =>
      _suggestionsStreamController.stream;

  final debouncer = Debouncer(duration: const Duration(milliseconds: 200));

  MovieRemoteDataSourceImpl({required this.client});

  Future<String> _getJsonData(String endPoint, {int page = 1}) async {
    final url = Uri.https(_baseUrl, endPoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingMoviesResponse = NowPlayingResponseModel.fromJson(jsonData);
    onDisplayMovies = nowPlayingMoviesResponse.results as List<MovieModel>;
    return onDisplayMovies;
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    if (_popularPage < 1000) {
      _popularPage++;
      final jsonData =
          await _getJsonData('3/movie/popular', page: _popularPage);
      final popularMoviesResponse = PopularResponseModel.fromJson(jsonData);
      final popularMovies = popularMoviesResponse.results as List<MovieModel>;
      return popularMovies;
    } else {
      return nowPopularMovies;
    }
  }

  @override
  Future<List<CastModel>> getCreditsResponse(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    // print('Asking for actors of movie $movieId');
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponseModel.fromJson(jsonData);
    moviesCast[movieId] = creditsResponse.cast as List<CastModel>;
    return moviesCast[movieId]!;
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
      'query': query,
    });

    final response = await http.get(url);
    final searchResponse = SearchMovieResponseModel.fromJson(response.body);
    final results = searchResponse.results as List<MovieModel>;

    return results;
  }

  @override
  Stream<List<MovieModel>> getSuggestionsByQuery(String searchTerm) {
    debouncer.onValue = (value) async {
      final results = await searchMovies(value);
      _suggestionsStreamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());

    return suggestionStream;
  }
}