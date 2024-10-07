import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Make sure to import http
import 'dart:convert';

class SearchProvider with ChangeNotifier {
  String? _selectedGenre;
  String? _selectedYear;
  String? _selectedActor;
  String? _selectedDirector;
  String? _searchQuery; // Added to store search query
  List<dynamic> _searchResults = [];
  List<dynamic> _actors = [];
  List<dynamic> _directors = [];

  String? get selectedGenre => _selectedGenre;
  String? get selectedYear => _selectedYear;
  String? get selectedActor => _selectedActor;
  String? get selectedDirector => _selectedDirector;
  List<dynamic> get searchResults => _searchResults;
  List<dynamic> get actors => _actors;
  List<dynamic> get directors => _directors;

  void setGenre(String? genre) {
    _selectedGenre = genre;
    notifyListeners();
  }

  void setYear(String? year) {
    _selectedYear = year;
    notifyListeners();
  }

  void setSelectedActor(String? actor) {
    _selectedActor = actor;
    notifyListeners();
  }

  void setSelectedDirector(String? director) {
    _selectedDirector = director;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query; // Store the search query
    notifyListeners(); // Notify listeners
  }

  Future<void> fetchActors() async {
    const String apiKey = '572595a400571c451703bb5000ece897';
    String url = 'https://api.themoviedb.org/3/person/popular?api_key=$apiKey&language=fr-FR&page=1';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _actors = data['results'];
      notifyListeners();
    } else {
      throw Exception('Échec du chargement des acteurs');
    }
  }

  Future<void> fetchDirectors() async {
    const String apiKey = '572595a400571c451703bb5000ece897';
    String url = 'https://api.themoviedb.org/3/person/popular?api_key=$apiKey&language=fr-FR&page=1';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _directors = data['results'];
      notifyListeners();
    } else {
      throw Exception('Échec du chargement des réalisateurs');
    }
  }

  Future<void> searchMovies() async {
    const String apiKey = '572595a400571c451703bb5000ece897';
    String url = 'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=fr-FR&sort_by=popularity.desc';

    if (_selectedGenre != null && _selectedGenre!.isNotEmpty) {
      url += '&with_genres=$_selectedGenre';
    }
    if (_selectedYear != null && _selectedYear!.isNotEmpty) {
      url += '&primary_release_year=$_selectedYear';
    }
    if (_selectedActor != null && _selectedActor!.isNotEmpty) {
      url += '&with_cast=$_selectedActor';
    }
    if (_selectedDirector != null && _selectedDirector!.isNotEmpty) {
      url += '&with_crew=$_selectedDirector';
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _searchResults = data['results'];
      notifyListeners();
    } else {
      throw Exception('Échec du chargement des films');
    }
  }
}
