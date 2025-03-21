import 'package:ca_movie_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ca_movie_app/core/helpers/search_delegate.dart';
import 'package:ca_movie_app/features/ca_movies/presentation/bloc/blocs.dart';
import 'package:ca_movie_app/features/ca_movies/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //     onPressed: () {
          //       // Navigator.pushNamed(context, 'language');
          //     },
          //     icon: const Icon(Icons.language)),
              //TODO Localization
          title: const Text(Constants.homeScreenTxt),
          actions: [
            IconButton(
                onPressed: (() => showSearch(
                    context: context, delegate: MovieSearchDelegate())),
                icon: const Icon(Icons.search)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<NowPlayingMoviesBloc, NowPlayingMoviesState>(
                builder: (context, state) {
                  if (state is NowPlayingMoviesLoadingState) {
                    return SizedBox(
                      height: size.height * 0.5,
                      width: size.width,
                      child: Center(
                        child: SizedBox(
                          height: size.width * 0.7,
                          width: size.width * 0.7,
                          child: const CircularProgressIndicator(
                            strokeWidth: 12,
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is NowPlayingMoviesLoadedState) {
                    return CardSwiper(movies: state.nowPlayingMovies);
                  }
                  if (state is NowPlayingMoviesErrorState) {
                    return MessageDisplay(
                      message: state.errorMessage,
                      height: size.height * 0.5,
                      width: size.width,
                    );
                  } else {
                    return MessageDisplay(
                      message: '',
                      height: size.height * 0.5,
                      width: size.width,
                    );
                  }
                },
              ),
              //Row of movies
              BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                builder: (context, state) {
                  if (state is PopularMoviesLoadingState) {
                    return SizedBox(
                      height: 260,
                      width: size.width,
                      child: Center(
                        child: SizedBox(
                          height: size.width * 0.5,
                          width: size.width * 0.5,
                          child: const CircularProgressIndicator(
                            strokeWidth: 12,
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is PopularMoviesLoadedState) {
                    final bloc = context.read<PopularMoviesBloc>();
                    // return MovieSliderScreen(
                    return ImageSliderWidget(
                      //TODO Localization
                      title: Constants.popularTxt,
                      movies: state.popularMovies,
                      onNextPage: () {
                        bloc.add(
                          UpdatePopularMoviesEvent(
                              popularMovies: state.popularMovies),
                        );
                      },
                    );
                  }
                  
                  if (state is PopularMoviesErrorState) {
                    return MessageDisplay(
                      message: state.errorMessage,
                      height: size.height * 0.3,
                      width: size.width,
                    );
                  } else {
                    return MessageDisplay(
                      message: '',
                      height: size.height * 0.3,
                      width: size.width,
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}