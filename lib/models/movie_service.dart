import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<Map<String, String>>> fetchMovies() async {
  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=572595a400571c451703bb5000ece897&language=fr-FR&page=1'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    List<Map<String, String>> movies = [];
    for (var movie in data['results']) {
      movies.add({
        'title': movie['title'],
        'image': 'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
        'synopsis': movie['overview'],
        'releaseDate': movie['release_date'],
      });
    }
    return movies;
  } else {
    throw Exception('Failed to load movies');
  }
}
// Modèle de film
class Movie {
  final String title;
  final String image;
  final String synopsis;
  final String releaseDate;

  static var isFavorite;

  Movie({
    required this.title,
    required this.image,
    required this.synopsis,
    required this.releaseDate,
  });

  Map<String, String> toMap() {
    return {
      'title': title,
      'image': image,
      'synopsis': synopsis,
      'releaseDate': releaseDate,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'],
      image: map['image'],
      synopsis: map['synopsis'],
      releaseDate: map['releaseDate'],
    );
  }
}
