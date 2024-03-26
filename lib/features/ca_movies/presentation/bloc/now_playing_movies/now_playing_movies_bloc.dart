import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ca_movie_app/core/constants/constants.dart';
import 'package:ca_movie_app/core/usecases/usecase.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/movie.dart';
import 'package:ca_movie_app/features/ca_movies/domain/usecases/get_now_playing_movies.dart';

part 'now_playing_movies_event.dart';
part 'now_playing_movies_state.dart';

class NowPlayingMoviesBloc extends Bloc<MoviesEvent, NowPlayingMoviesState> {

  final GetNowPlayingMovies getNowPlayingMovies;

  NowPlayingMoviesBloc({required this.getNowPlayingMovies})
      : super(NowPlayingMoviesInitialState()) {
        
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      emit(NowPlayingMoviesLoadingState());
      final failureOrPlayingMovies = await getNowPlayingMovies(NoParams());
      failureOrPlayingMovies.fold((failure) {
        emit(const NowPlayingMoviesErrorState(  
          errorMessage: Constants.serverFailureMsg,
        ));
      }, (movies) {
        emit(NowPlayingMoviesLoadedState(nowPlayingMovies: movies));
      });
    });
  }
}
