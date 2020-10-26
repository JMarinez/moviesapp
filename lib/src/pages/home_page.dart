import 'package:flutter/material.dart';
import 'package:moviesapp/src/providers/movie_provider.dart';

import 'package:moviesapp/src/widgets/card_swiper.dart';

class HomePage extends StatelessWidget {
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
        children: [
          _swipeMovieCards(),
        ],
      ),
    );
  }

  Widget _swipeMovieCards() {

    final movieProvider = MovieProvider();

    movieProvider.getNowPlaying();

    return CardSwiper(movies: [1,2,3,4,5],);
  }
}
