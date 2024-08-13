import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_movie_flutter/bloc/movie_bloc/movie_bloc.dart';
import 'package:search_movie_flutter/pages/movie_info/movie_info.dart';
import 'package:search_movie_flutter/services/movie_api_service.dart';

import 'pages/search_movie/search_movie.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(MovieApiService()),
      child: MaterialApp(
          theme: customTheme,
          debugShowCheckedModeBanner: false,
          home: const SearchMoviePage(),
          routes: {'/movieInfo': (context) => const MovieInfoPage()}),
    );
  }
}
