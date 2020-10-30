import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:moviesapp/src/models/movie.dart';

class MovieProvider {
  String _apiKey = 'ad41c18aa85afbcd874a406cdfd08fb6';
  String _url = 'api.themoviedb.org';
  String _language = 'en-US';

  int _moviePages = 0;

  List<Movie> _movies = List<Movie>();

  final _popularMovieStreamController = StreamController();

  Function(List<Movie>) get _popularMoviesSink => _popularMovieStreamController.sink.add;

  Stream<List<Movie>> get _popularMoviesStream => _popularMovieStreamController.stream;

  void dispose() {
    _popularMovieStreamController?.close();
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(
      _url,
      '3/movie/now_playing',
      {
        'api_key': _apiKey,
        'language': _language,
      },
    );

    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final movies = Movies.fromJsonList(decodedData['results']);

    return movies.movies;
  }

  Future<List<Movie>> getPopularMovies() async {

    _moviePages++;

    final url = Uri.http(
      _url,
      '3/movie/popular',
      {
        'api_key': _apiKey,
        'language': _language,
      },
    );

    final response = await http.get(url);
    final decodedData = json.decode(response.body);

    final movies = Movies.fromJsonList(decodedData['results']);

    _movies.addAll(movies.movies);
    _popularMoviesSink(movies.movies);

    return movies.movies;
  }
}
