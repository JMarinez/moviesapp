import 'package:flutter/material.dart';
import 'package:moviesapp/src/providers/movie_provider.dart';

import 'package:moviesapp/src/widgets/card_swiper.dart';
import 'package:moviesapp/src/widgets/movie_slider.dart';

class HomePage extends StatelessWidget {
  final movieProvider = MovieProvider();

  @override
  Widget build(BuildContext context) {
    movieProvider.getPopularMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _swipeMovieCards(),
          _footer(context),
        ],
      ),
    );
  }

  Widget _swipeMovieCards() {
    return FutureBuilder(
      future: movieProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            movies: snapshot.data,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Popular movies',
                style: Theme.of(context).textTheme.subtitle1),
          ),
          SizedBox(
            height: 10.0,
          ),
          StreamBuilder(
            stream: movieProvider.popularMoviesStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return MovieSlider(
                  movies: snapshot.data,
                  nextPage: movieProvider.getPopularMovies,
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
