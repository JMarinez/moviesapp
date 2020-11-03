import 'package:flutter/material.dart';
import 'package:moviesapp/src/models/movie.dart';

class MovieDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Container(
      child: Center(child: Text(movie.title),),
    );
  }
}