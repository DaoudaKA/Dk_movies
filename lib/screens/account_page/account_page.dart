import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 24, 49), // Couleur de fond de la page
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Ajout d'une marge autour du contenu
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centre verticalement le contenu
          children: [
            // Bouton "À regarder plus tard"
            _buildOptionButton(
              icon: Icons.video_library,
              text: 'À regarder plus tard',
              onTap: () {
                // Action à définir pour "À regarder plus tard"
              },
            ),
            SizedBox(height: 20), // Espacement vertical entre les boutons
            // Bouton "Téléchargement"
            _buildOptionButton(
              icon: Icons.file_download,
              text: 'Téléchargement',
              onTap: () {
                // Action à définir pour "Téléchargement"
              },
            ),
            SizedBox(height: 20),
            Divider(color: Colors.white54), // Ligne de séparation
            SizedBox(height: 20), // Espacement vertical avant le bouton "Déconnecter"
            // Bouton "Déconnecter"
            ElevatedButton(
              onPressed: () {
                // Action à définir pour "Déconnecter"
              },
              child: Text('Déconnecter'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Ajout de padding
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour construire un bouton d'option avec un icône et un texte
  Widget _buildOptionButton({required IconData icon, required String text, required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap, // Gère le clic
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent, // Couleur de fond bleu
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Ajout de padding
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Centre horizontalement le contenu du bouton
        children: [
          Icon(icon, color: Colors.white), // Icône
          SizedBox(width: 10), // Espacement horizontal
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18), // Style du texte
          ),
        ],
      ),
    );
  }
}
