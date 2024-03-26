import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ca_movie_app/core/constants/constants.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/movie.dart';
import 'package:ca_movie_app/features/ca_movies/domain/usecases/get_suggestions_by_query.dart';


part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSuggestionsByQuery getSuggestionsByQuery;

  SearchBloc({required this.getSuggestionsByQuery})
      : super(SearchInitialState()) {
    on<SearchMovieEvent>((event, emit) async {
      final failureOrMovie =
          await getSuggestionsByQuery(Params(query: event.query));
      failureOrMovie.fold((failure) {
        emit(
          const SearchErrorState(
            errorMessage: Constants.serverFailureMsg,
            ),
        );
      }, (movies) {
        emit(SearchLoadedState(movies: movies));
      });
    });
  }
}