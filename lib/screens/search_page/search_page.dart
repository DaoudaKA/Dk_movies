/*import 'package:flutter/material.dart';
import 'package:movie/providers/search_provider.dart';
import 'package:provider/provider.dart';
import 'results_page.dart'; 

// Page principale de recherche qui permet à l'utilisateur de saisir des critères de recherche
class SearchPage extends StatelessWidget {
  // Contrôleur pour le champ de texte du titre du film
  final TextEditingController titleController = TextEditingController(); 
  // Contrôleur pour le champ de texte de l'acteur
  final TextEditingController actorController = TextEditingController(); 
  // Contrôleur pour le champ de texte du réalisateur
  final TextEditingController directorController = TextEditingController(); 

  // Liste de genres de films disponibles
  final List<String> genres = [
    'Action', 
    'Comédie', 
    'Aventure', 
    'Drame', 
    'Science-fiction', 
    'Horreur'
  ]; 
  // Liste d'années de sortie de films disponibles
  final List<String> years = [
    '2024', 
    '2023', 
    '2022', 
    '2021', 
    '2020', 
    '2019', 
    '2018', 
    '2017'
  ]; 

  @override
  Widget build(BuildContext context) {
    // Utilisation de ChangeNotifierProvider pour gérer l'état de recherche
    return ChangeNotifierProvider(
      create: (_) => SearchProvider(), // Création d'une instance de SearchProvider
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 24, 49), // Couleur de fond de la page
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0), // Espacement autour du contenu
          child: Column(
            children: [
              // Champs de texte pour la recherche du titre, acteur et réalisateur
              _buildTextField(titleController, 'Titre du film', 'Entrez le titre...', Icons.search),
              const SizedBox(height: 10), // Espacement vertical
              _buildTextField(actorController, 'Acteur', 'Entrez l\'acteur...', Icons.person),
              const SizedBox(height: 10),
              _buildTextField(directorController, 'Réalisateur', 'Entrez le réalisateur...', Icons.person),
              const SizedBox(height: 10),

              // Ligne contenant les Dropdowns pour le genre et l'année
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Alignement horizontal des éléments
                children: [
                  _buildDropdown(genres, 'Genre', 
                    (provider) => provider.selectedGenre, 
                    (provider, value) => provider.setGenre(value)),
                  const SizedBox(width: 10), // Espacement horizontal
                  _buildDropdown(years, 'Année', 
                    (provider) => provider.selectedYear, 
                    (provider, value) => provider.setYear(value)),
                ],
              ),
              const SizedBox(height: 20), // Espacement vertical

              // Bouton pour déclencher la recherche
              ElevatedButton(
                onPressed: () {
                  // Récupération des valeurs saisies par l'utilisateur
                  String title = titleController.text; // Titre du film
                  String actor = actorController.text; // Nom de l'acteur
                  String director = directorController.text; // Nom du réalisateur
                  String genre = Provider.of<SearchProvider>(context, listen: false).selectedGenre ?? 'Non spécifié'; // Genre sélectionné
                  String year = Provider.of<SearchProvider>(context, listen: false).selectedYear ?? 'Non spécifié'; // Année sélectionnée

                  // Navigation vers la page de résultats en passant les critères de recherche
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        title: title,
                        actor: actor,
                        director: director,
                        genre: genre,
                        year: year,
                      ),
                    ),
                  );
                },
                child: Text('Rechercher'), // Texte du bouton
              ),
              const SizedBox(height: 20), // Espacement vertical
            ],
          ),
        ),
      ),
    );
  }

  // Méthode pour construire un champ de texte personnalisé
  Widget _buildTextField(TextEditingController controller, String label, String hint, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1), // Couleur de fond du champ de texte
        borderRadius: BorderRadius.circular(30), // Coins arrondis
      ),
      child: TextField(
        controller: controller, // Contrôleur associé au champ de texte
        decoration: InputDecoration(
          labelText: label, // Étiquette du champ
          border: InputBorder.none, // Pas de bordure
          hintText: hint, // Texte d'indication
          prefixIcon: Icon(icon, color: Colors.white), // Icône à gauche du champ
          hintStyle: TextStyle(color: Colors.white54), // Style du texte d'indication
        ),
        style: TextStyle(color: Colors.white), // Couleur du texte
      ),
    );
  }

  // Méthode pour construire une liste déroulante personnalisée
  Widget _buildDropdown(List<String> items, String hint, String? Function(SearchProvider) getSelectedValue, void Function(SearchProvider, String?) onChanged) {
    return Consumer<SearchProvider>(
      builder: (context, provider, child) => Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1), // Couleur de fond de la liste déroulante
            borderRadius: BorderRadius.circular(30), // Coins arrondis
          ),
          child: DropdownButtonHideUnderline( // Masquer la ligne de soulignement de la liste déroulante
            child: DropdownButton<String>(
              hint: Padding(
                padding: const EdgeInsets.only(left: 8.0), // Espacement à gauche du texte d'indication
                child: Text(hint, style: TextStyle(color: Colors.white54)), // Texte d'indication
              ),
              value: getSelectedValue(provider), // Valeur actuellement sélectionnée
              items: items.map((String item) {
                return DropdownMenuItem<String>( // Élément de la liste déroulante
                  value: item, // Valeur de l'élément
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0), // Espacement à gauche du texte
                    child: Text(item, style: TextStyle(color: Colors.white)), // Texte de l'élément
                  ),
                );
              }).toList(), // Conversion de la liste d'éléments en liste d'éléments de menu
              onChanged: (value) => onChanged(provider, value), // Action lorsque l'élément est sélectionné
              dropdownColor: const Color.fromARGB(255, 3, 24, 49), // Couleur de fond de la liste déroulante
            ),
          ),
        ),
      ),
    );
  }
}
*/