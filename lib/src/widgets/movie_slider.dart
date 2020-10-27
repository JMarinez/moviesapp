import 'package:flutter/material.dart';
import 'package:moviesapp/src/models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;

  MovieSlider({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.2,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        children: _movieCards(),
      ),
    );
  }

  List<Widget> _movieCards() {
    return movies.map((movie) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage(
              movie.getPosterImage(),
            ),
            height: 160.0,
          ),
        ),
      );
    }).toList();
  }
}
