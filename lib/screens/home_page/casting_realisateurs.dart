import 'package:flutter/material.dart';

class CastingAndDirectorsPage extends StatefulWidget {
  @override
  State<CastingAndDirectorsPage> createState() => _CastingAndDirectorsPageState();
}

class _CastingAndDirectorsPageState extends State<CastingAndDirectorsPage> {
  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = const Color.fromARGB(255, 3, 24, 49); // Définition de la couleur de fond

    return Scaffold(
      // AppBar qui contient le titre et le bouton de retour
      appBar: AppBar(
        title: Text(
          "Casting - Réalisateurs",
          style: const TextStyle(color: Colors.white), // Texte de l'AppBar en blanc
        ),
        backgroundColor: backgroundColor, // Utilisation de la même couleur que le fond de la page
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Icône de retour en blanc
          onPressed: () {
            Navigator.pop(context); // Action de retour à la page précédente
          },
        ),
      ),
      body: Container(
        color: backgroundColor, // Couleur de fond de la page
        width: double.infinity, // Prend toute la largeur disponible
        padding: const EdgeInsets.all(16.0), // Ajout d'un peu de marge tout autour
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alignement du contenu à gauche
            children: [
              // Section Casting
              Text(
                "Casting :",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10), // Espacement
              // Liste des acteurs affichés verticalement
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Acteur 1", style: TextStyle(color: Colors.white)),
                  Text("Acteur 2", style: TextStyle(color: Colors.white)),
                  Text("Acteur 3", style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 20), // Espacement

              // Section Réalisateurs
              Text(
                "Réalisateurs :",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10), // Espacement
              // Liste des réalisateurs affichés verticalement
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Réalisateur 1", style: TextStyle(color: Colors.white)),
                  Text("Réalisateur 2", style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: backgroundColor, // Couleur de fond du Scaffold
    );
  }
}
