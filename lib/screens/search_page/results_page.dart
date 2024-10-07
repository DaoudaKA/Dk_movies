import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String title;
  final String actor;
  final String director;
  final String genre;
  final String year;

  const ResultsPage({
    Key? key,
    required this.title,
    required this.actor,
    required this.director,
    required this.genre,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résultats de recherche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Titre: $title'),
            Text('Acteur: $actor'),
            Text('Réalisateur: $director'),
            Text('Genre: $genre'),
            Text('Année: $year'),
            // Ici vous pouvez ajouter d'autres widgets pour afficher les résultats
          ],
        ),
      ),
    );
  }
}
