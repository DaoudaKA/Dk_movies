import 'package:flutter/material.dart';

// Page Bande Annonce
class BandeAnnoncePage extends StatefulWidget {
  @override
  State<BandeAnnoncePage> createState() => _BandeAnnoncePageState();
}

class _BandeAnnoncePageState extends State<BandeAnnoncePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar qui contient le titre et le bouton de retour
      appBar: AppBar(
        title: Text(
          "Bande Annonce",
          style: const TextStyle(color: Colors.white), // Texte de l'AppBar en blanc
        ),
        backgroundColor: const Color.fromARGB(255, 3, 24, 49), // Couleur de fond de l'AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Icône de retour en blanc
          onPressed: () {
            Navigator.pop(context); // Action de retour à la page précédente
          },
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 3, 24, 49), // Couleur de fond de la page
        width: double.infinity, // Prend toute la largeur disponible
        padding: const EdgeInsets.all(16.0), // Ajout d'un peu de marge tout autour
        child: Center(
          child: Container(
            width: 300, // Largeur de l'espace rectangulaire
            height: 200, // Hauteur de l'espace rectangulaire
            decoration: BoxDecoration(
              color: Color.fromARGB(206, 222, 222, 222).withOpacity(0.1), // Couleur de fond de l'espace rectangle
              borderRadius: BorderRadius.circular(16.0), // Coins arrondis
            ),
          ),
        ),
      ),
    );
  }
}
