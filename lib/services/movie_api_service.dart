import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:search_movie_flutter/models/movie.dart';

class MovieApiService {
  Future<List<Movie>> fetchMovies(String title, String type) async {
    const publicKey = 'a80cbbe7';
    final response = await http.get(Uri.parse(
        'https://omdbapi.com/?apikey=$publicKey&s=$title&type=$type'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['Search'];
      return data.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
