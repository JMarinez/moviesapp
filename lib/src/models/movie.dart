class Movies {

  List<Movie> movies = List();

  Movies();

  Movies.fromJsonList(List<dynamic> moviesJson) {

    if (moviesJson == null) {
      return;
    }

    for(var item in moviesJson) {
      var movie = Movie.fromJsonMap(item);
      movies.add(movie);
    }
  }
}


class Movie {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Movie({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJsonMap(Map<String, dynamic> json) {
    popularity = json['popularity'] / 1;
    voteCount = json['vote_Count'];
    video = json['video'];
    posterPath = json['poster_path'];
    id = json['id'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    title = json['title'];
    voteAverage = json['vote_average'] / 1;
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  String getPosterImage() {
    if (posterPath == null) {
      return 'https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/1/8/6/0/230681-6-eng-GB/IB3-Limited-SIC-Pharma-April-20142_news_large.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }
}
