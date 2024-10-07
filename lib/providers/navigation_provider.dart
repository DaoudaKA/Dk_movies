import 'package:flutter/material.dart';

// Cette classe gère l'état de la navigation (l'index de la page sélectionnée)
/*class NavigationProvider with ChangeNotifier {
  // Variable privée pour stocker l'index de la page sélectionnée
  int _selectedIndex = 0; // Index par défaut (accueil)

  // Getter pour obtenir l'index actuel de la page sélectionnée
  int get selectedIndex => _selectedIndex;

  // Méthode pour mettre à jour l'index sélectionné et notifier l'interface
  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // Notifie les widgets dépendants pour mettre à jour l'affichage
  }
}*/


class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

