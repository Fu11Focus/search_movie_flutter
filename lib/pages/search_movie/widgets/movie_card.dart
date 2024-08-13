import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_movie_flutter/bloc/movie_bloc/movie_bloc.dart';
import 'package:search_movie_flutter/bloc/movie_bloc/movie_event.dart';
import 'package:search_movie_flutter/data/data.dart';
import 'package:search_movie_flutter/models/movie.dart';
import 'package:search_movie_flutter/services/movie_api_service.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;
  final VoidCallback updateMovie;
  const MovieCard({super.key, required this.movie, required this.updateMovie});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    var movie = widget.movie;

    void toggleFavoriteStatus() {
      setState(() {
        BlocProvider.of<MovieBloc>(context)
            .add(ToggleFavoriteMovieEvent(movie));
      });
    }

    return BlocProvider(
      create: (context) => MovieBloc(MovieApiService()),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          '/movieInfo',
          arguments: {
            'movie': movie,
            'toggleFavorite': () => toggleFavoriteStatus(),
          },
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(movie.title.length < 30
                    ? movie.title.toString()
                    : '${movie.title.substring(0, 30)}...'),
                IconButton(
                    onPressed: () {
                      //change favorite status
                      toggleFavoriteStatus();
                    },
                    icon: MovieDB(
                                movie.title,
                                movie.imdbID.toString(),
                                movie.poster.toString(),
                                movie.type.toString(),
                                movie.year.toString())
                            .isFavorite(movie.imdbID)
                        ? const Icon(
                            Icons.star,
                            color: Colors.orange,
                          )
                        : const Icon(Icons.star_border_outlined))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
