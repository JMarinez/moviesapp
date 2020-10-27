import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:moviesapp/src/models/movie.dart';

class MovieProvider {
  String _apiKey = 'ad41c18aa85afbcd874a406cdfd08fb6';
  String _url = 'api.themoviedb.org';
  String _language = 'en-US';

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

    return movies.movies;
  }
}
