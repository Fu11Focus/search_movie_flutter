import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_movie_flutter/bloc/movie_bloc/movie_bloc.dart';
import 'package:search_movie_flutter/bloc/movie_bloc/movie_event.dart';
import 'package:search_movie_flutter/bloc/movie_bloc/movie_state.dart';
import 'package:search_movie_flutter/bloc/type_movie_bloc/type_movie_bloc.dart';
import 'package:search_movie_flutter/pages/search_movie/widgets/movie_card.dart';
import 'package:search_movie_flutter/services/movie_api_service.dart';

import 'widgets/segment_control.dart';

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({super.key});

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool firstClick = false;

  String? _validation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (value.length < 2 || !RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
      return 'Please enter a valid text with at least 2 characters';
    } else {
      return null;
    }
  }

  String? getMovie(BuildContext context, String type) {
    setState(() {
      firstClick = true;
    });

    if (_formKey.currentState!.validate() && type.isNotEmpty) {
      BlocProvider.of<MovieBloc>(context).add(
        FetchMovies(
            _controller.text, BlocProvider.of<TypeMovieBloc>(context).state),
      );
      return null;
    }
    if (type.isEmpty) {
      return 'Please select type for searching';
    }
    return 'Please enter a valid text with at least 2 characters';
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TypeMovieBloc()),
        BlocProvider(create: (context) => MovieBloc(MovieApiService())),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Movie Boom💥'),
          ),
          body: BlocBuilder<TypeMovieBloc, String>(builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _controller,
                      onFieldSubmitted: (value) => getMovie(context, state),
                      validator: (value) => _validation(value),
                      decoration: const InputDecoration(hintText: 'Typing...'),
                    ),
                  ),
                  TextButton(
                    onPressed: () => getMovie(context, state),
                    child: const Text('Search'),
                  ),
                  const SegmentControl(),
                  if (state.isEmpty && firstClick)
                    SizedBox(
                      height: 20,
                      child: Text(
                        'Should be selected at least one',
                        style: TextStyle(color: Colors.red[300]),
                      ),
                    ),
                  Expanded(
                    child: BlocBuilder<MovieBloc, MovieState>(
                      builder: (context, state) {
                        if (state is MovieInitial) {
                          return const Center(
                              child: Text('Something went wrong!'));
                        } else if (state is MovieLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is MovieLoaded) {
                          return ListView.builder(
                              itemCount: state.movies.length,
                              itemBuilder: (context, index) => MovieCard(
                                    movie: state.movies[index],
                                    updateMovie: () => getMovie(
                                        context,
                                        BlocProvider.of<TypeMovieBloc>(context)
                                            .state),
                                  ));
                        } else if (state is MovieError) {
                          return Center(child: Text(state.message));
                        } else {
                          return const Center(
                              child: Text('Something went wrong!'));
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
