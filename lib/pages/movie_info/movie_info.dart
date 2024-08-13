import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_movie_flutter/bloc/movie_bloc/movie_bloc.dart';
import 'package:search_movie_flutter/data/data.dart';
import 'package:search_movie_flutter/models/movie.dart';
import 'package:search_movie_flutter/services/movie_api_service.dart';

class MovieInfoPage extends StatefulWidget {
  const MovieInfoPage({super.key});

  @override
  State<MovieInfoPage> createState() => _MovieInfoPageState();
}

class _MovieInfoPageState extends State<MovieInfoPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;

    // Убедитесь, что movie не равен null
    if (args == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Movie Info'),
        ),
        body: const Center(
          child: Text('No movie data'),
        ),
      );
    }
    final movie = args['movie'] as Movie;
    final Function toggleFavorite = args['toggleFavorite'] as Function;

    return BlocProvider(
      create: (context) => MovieBloc(MovieApiService()), // Подача MovieBloc
      child: Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  toggleFavorite();
                });
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
                  : const Icon(Icons.star_border_outlined),
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  movie.poster.toString(),
                  height: 300,
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title: ${movie.title}',
                        style: const TextStyle(color: Colors.white)),
                    Text('Year: ${movie.year}',
                        style: const TextStyle(color: Colors.white)),
                    Text('imdbID: ${movie.imdbID}',
                        style: const TextStyle(color: Colors.white)),
                    Text('Type: ${movie.type}',
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
