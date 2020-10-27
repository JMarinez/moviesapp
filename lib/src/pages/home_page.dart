import 'package:flutter/material.dart';
import 'package:moviesapp/src/providers/movie_provider.dart';

import 'package:moviesapp/src/widgets/card_swiper.dart';
import 'package:moviesapp/src/widgets/movie_slider.dart';

class HomePage extends StatelessWidget {
  final movieProvider = MovieProvider();

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            child:
                Text('Popular', style: Theme.of(context).textTheme.subtitle1),
          ),
          SizedBox(
            height: 10.0,
          ),
          FutureBuilder(
            future: movieProvider.getPopularMovies(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return MovieSlider(
                  movies: snapshot.data,
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
