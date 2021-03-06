import 'package:flutter/material.dart';

import 'package:moviesapp/src/pages/home_page.dart';
import 'package:moviesapp/src/widgets/movie_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'movieDetail': (BuildContext context) => MovieDetail(),
      },
    );
  }
}
