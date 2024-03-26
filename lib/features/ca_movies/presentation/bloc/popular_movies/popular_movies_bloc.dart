import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ca_movie_app/core/constants/constants.dart';
import 'package:ca_movie_app/core/usecases/usecase.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/movie.dart';
import 'package:ca_movie_app/features/ca_movies/domain/usecases/get_popular_movies.dart';






part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;

  PopularMoviesBloc({
    required this.getPopularMovies,
  }) : super(PopularMoviesInitialState()) {
    
    on<GetPopularMoviesEvent>((event, emit) async {
      emit(PopularMoviesLoadingState());
      final failureOrPopularMovies = await getPopularMovies(NoParams());
      failureOrPopularMovies.fold((failure) {
        emit(const PopularMoviesErrorState(
          errorMessage: Constants.serverFailureMsg,
        ));
      }, (movies) {
        emit(PopularMoviesLoadedState(
            popularMovies: [...event.popularMovies, ...movies]));
      });
    });

    on<UpdatePopularMoviesEvent>((event, emit) async {
      final failureOrPopularMovies = await getPopularMovies(NoParams());
      failureOrPopularMovies.fold((failure) {
        emit(const PopularMoviesErrorState(
          errorMessage: Constants.serverFailureMsg,
        ));
      }, (movies) {
        emit(PopularMoviesLoadedState(
            popularMovies: [...event.popularMovies, ...movies]));
      });
    });
  }
}