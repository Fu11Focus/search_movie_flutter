class Movie {
  final String title;
  final String? year, imdbID, type, poster;

  Movie({
    required this.title,
    this.year,
    this.imdbID,
    this.type,
    this.poster,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['Title'],
        year: json['Year'],
        imdbID: json['imdbID'],
        type: json['Type'],
        poster: json['Poster']);
  }
}
