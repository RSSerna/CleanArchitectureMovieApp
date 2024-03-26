import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ca_movie_app/core/constants/constants.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/cast.dart';
import 'package:ca_movie_app/features/ca_movies/domain/usecases/get_credits_response.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCreditsResponse getCreditsResponse;

  CastBloc({required this.getCreditsResponse}) : super(CastInitialState()) {
    on<GetCastEvent>((event, emit) async {
      final failureOrCast =
          await getCreditsResponse(Params(movieId: event.movieId));
      failureOrCast.fold((failure) {
        emit(const CastErrorState(
          errorMessage: Constants.serverFailureMsg,
        ));
      }, (cast) {
        emit(CastLoadedState(castList: cast));
      });
    });
  }
}
