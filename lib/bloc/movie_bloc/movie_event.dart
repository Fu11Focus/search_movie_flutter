import 'package:search_movie_flutter/models/movie.dart';

abstract class MovieEvent {}

class FetchMovies extends MovieEvent {
  final String title, type;

  FetchMovies(this.title, this.type);
}

class ToggleFavoriteMovieEvent extends MovieEvent {
  final Movie movie;

  ToggleFavoriteMovieEvent(this.movie);
}
