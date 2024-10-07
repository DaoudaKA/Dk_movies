import 'package:flutter/material.dart';
import 'package:movie/providers/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchMoviesPageState createState() => _SearchMoviesPageState();
}

class _SearchMoviesPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.fetchActors(); // Récupérer les acteurs
    searchProvider.fetchDirectors(); // Récupérer les réalisateurs
  }

  final List<String> genres = [
    'Action',
    'Aventure',
    'Comédie',
    'Drame',
    'Horreur',
    'Romance',
    // Ajoutez d'autres genres ici
  ];

  final List<String> years = [
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024'
    // Ajoutez d'autres années ici
  ];

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Recherche Avancée de Films',
            style: GoogleFonts.lobster(), // Police personnalisée
          ),
        ),
        backgroundColor: Colors.blue, // Couleur de l'AppBar
      ),
      backgroundColor: const Color.fromARGB(
          255, 247, 244, 244), // Couleur de fond de la page
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Champ de saisie pour le titre du film
            TextField(
              decoration: InputDecoration(
                labelText: 'Titre du film',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: Colors.blue), // Couleur de la bordure
                ),
              ),
              onChanged: (String query) {
                searchProvider.setSearchQuery(query);
              },
            ),
            SizedBox(height: 30), // Espace entre les champs

            // Liste déroulante pour le genre
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Genre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              items: genres.map((String genre) {
                return DropdownMenuItem<String>(
                  value: genre,
                  child: Text(genre),
                );
              }).toList(),
              onChanged: (String? selectedGenre) {
                searchProvider.setGenre(selectedGenre);
              },
              hint: Text('Sélectionner un genre'),
            ),
            SizedBox(height: 30), // Espace entre les champs

            // Liste déroulante pour l'acteur
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Acteur',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 42, 156, 201)),
                ),
              ),
              items: searchProvider.actors.map((dynamic actor) {
                return DropdownMenuItem<String>(
                  value: actor['id'].toString(),
                  child: Text(actor['name']),
                );
              }).toList(),
              onChanged: (String? selectedActor) {
                searchProvider.setSelectedActor(selectedActor);
              },
              hint: Text('Sélectionner un acteur'),
            ),
            SizedBox(height: 30), // Espace entre les champs

            // Liste déroulante pour le réalisateur
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Réalisateur',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 68, 160, 214)),
                ),
              ),
              items: searchProvider.directors.map((dynamic director) {
                return DropdownMenuItem<String>(
                  value: director['id'].toString(),
                  child: Text(director['name']),
                );
              }).toList(),
              onChanged: (String? selectedDirector) {
                searchProvider.setSelectedDirector(selectedDirector);
              },
              hint: Text('Sélectionner un réalisateur'),
            ),
            SizedBox(height: 30), // Espace entre les champs

            // Liste déroulante pour l'année de sortie
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Année de sortie',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
              items: years.map((String year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
              onChanged: (String? selectedYear) {
                searchProvider.setYear(selectedYear);
              },
              hint: Text('Sélectionner une année'),
            ),

            SizedBox(height: 30), // Espace avant le bouton de recherche

            // Bouton de recherche centré
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await searchProvider.searchMovies();
                },
                child: Text('Rechercher'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Couleur du bouton
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5, // Ombre pour le bouton
                ),
              ),
            ),

            SizedBox(height: 30), // Espace avant la liste des résultats

            // Affichage des résultats de la recherche
            Expanded(
              child: ListView.builder(
                itemCount: searchProvider.searchResults.length,
                itemBuilder: (context, index) {
                  final movie = searchProvider.searchResults[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    elevation: 4, // Ombre pour les cartes
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        movie['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      subtitle: Text(movie['release_date']),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
