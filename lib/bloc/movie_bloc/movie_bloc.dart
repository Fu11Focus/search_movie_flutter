import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realm/realm.dart';
import 'package:search_movie_flutter/bloc/movie_bloc/movie_event.dart';
import 'package:search_movie_flutter/bloc/movie_bloc/movie_state.dart';
import 'package:search_movie_flutter/data/data.dart';
import 'package:search_movie_flutter/services/movie_api_service.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieApiService movieApiService;

  MovieBloc(this.movieApiService) : super(MovieInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<ToggleFavoriteMovieEvent>(_onToggleFavoriteMovieEvent);
  }

  Future<void> _onFetchMovies(
      FetchMovies event, Emitter<MovieState> emit) async {
    try {
      emit(MovieLoading());
      final movies = await movieApiService.fetchMovies(event.title, event.type);
      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError('Failed to load movies'));
    }
  }

  void _onToggleFavoriteMovieEvent(
      ToggleFavoriteMovieEvent event, Emitter<MovieState> emit) async {
    var config = Configuration.local([MovieDB.schema]);
    var realm = Realm(config);
    MovieDB movie = MovieDB(
        event.movie.title,
        event.movie.year.toString(),
        event.movie.imdbID.toString(),
        event.movie.poster.toString(),
        event.movie.type.toString());

    var query = realm.query<MovieDB>(
      r'title == $0 AND year == $1 AND movieID == $2 AND poster == $3 AND type == $4',
      [
        event.movie.title,
        event.movie.year.toString(),
        event.movie.imdbID.toString(),
        event.movie.poster.toString(),
        event.movie.type.toString(),
      ],
    );

    realm.write(() {
      if (query.isNotEmpty) {
        realm.delete(query.first);
      } else {
        realm.add(movie);
      }
    });
    realm.close(); // Закрываем Realm
  }
}
