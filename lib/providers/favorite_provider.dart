import 'package:flutter/material.dart';
import 'package:movie/Database/database_helper.dart';
import 'package:movie/models/movie_service.dart';

class FavoriteProvider with ChangeNotifier {
  List<Movie> _favoriteMovies = [];

  FavoriteProvider() {
    _loadFavorites();
  }

  List<Movie> get favoriteMovies => _favoriteMovies;

  Future<void> _loadFavorites() async {
    final data = await DatabaseHelper().getFavorites();
    _favoriteMovies = data.map((item) => Movie.fromMap(item)).toList();
    notifyListeners();
  }

  bool isFavoritedByTitle(String title) {
    return _favoriteMovies.any((movie) => movie.title == title);
  }

  Future<void> toggleFavorite(Movie movie) async {
    if (isFavoritedByTitle(movie.title)) {
      await DatabaseHelper().deleteFavorite(movie.title);
      _favoriteMovies.removeWhere((m) => m.title == movie.title);
    } else {
      await DatabaseHelper().insertFavorite(movie.toMap());
      _favoriteMovies.add(movie);
    }
    notifyListeners();
  }
  void toggleFavoriteStatus(Movie movie) {
    Movie.isFavorite = !Movie.isFavorite;
    if (Movie.isFavorite) {
      _favoriteMovies.add(movie);
    } else {
      _favoriteMovies.remove(movie);
    }
    notifyListeners();
  }
}
