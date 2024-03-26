
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/movie.dart';


class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      // color: Colors.blueGrey,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.5,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, index) {
          // movies[index].heroID = 'swiper-${movies[index].id}';

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: movies[index]),
            child: Hero(
              tag: movies[index].heroID!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movies[index].posterPath!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
