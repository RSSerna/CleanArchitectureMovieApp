
import 'package:flutter/material.dart';
import 'package:ca_movie_app/features/ca_movies/domain/entities/movie.dart';

class ImageSliderWidget extends StatefulWidget {
  final List<Movie> movies;
  final String title;
  final Function onNextPage;

  const ImageSliderWidget(
      {Key? key,
      required this.movies,
      required this.title,
      required this.onNextPage})
      : super(key: key);

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 300 >=
          scrollController.position.maxScrollExtent) {
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: double.infinity,
        height: size.height * 0.45,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
                itemBuilder: (_, index) {
                  return _ImageInSlider(
                    title: widget.title,
                    movie: widget.movies[index],
                  );
                },
              ),
            ),
          ],
        ));
  }
}

class _ImageInSlider extends StatelessWidget {
  final Movie movie;
  final String title;
  const _ImageInSlider({
    Key? key,
    required this.movie,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(title);
    // String heroID = 'slider-$title-${movie.id}';
    // movie.heroID = heroID;
    // movie.overview = title + movie.overview ;
    return Container(
      width: 120,
      height: 110,
      // color: Colors.green,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              // print('Enviar este ${movie.heroID}');
              Navigator.pushNamed(context, 'details',
                  arguments: movie);
            },
            child: Hero(
              tag: movie.heroID!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.posterPath!),
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
