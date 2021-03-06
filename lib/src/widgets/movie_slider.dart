import 'package:flutter/material.dart';
import 'package:moviesapp/src/models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final Function nextPage;

  MovieSlider({@required this.movies, @required this.nextPage});

  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.25,
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        nextPage();
      }
    });

    return Container(
      height: screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        itemCount: movies.length,
        controller: _pageController,
        itemBuilder: (context, i) {
          return _movieCards(context, screenSize, movies[i]);
        },
      ),
    );
  }

  Widget _movieCards(BuildContext context, Size screenSize, Movie movie) {
    final movieCard = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(
                movie.getPosterImage(),
              ),
              height: screenSize.height * 0.15,
            ),
          ),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );

    return GestureDetector(
      child: movieCard,
      onTap: () => Navigator.pushNamed(context, 'movieDetail'),
    );
  }
}
