import 'package:flutter/material.dart';
import 'package:movie/providers/navigation_provider.dart';
import 'package:movie/providers/search_provider.dart';
import 'package:movie/providers/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart'; // Importez le fichier home.dart

/*void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion de Films', // Ajoutez un titre à l'application
      theme: ThemeData(
        primarySwatch: Colors.blue, // Définissez un thème de couleur
      ),
      home: Home(), // Définissez la page d'accueil
    );
  }
}*/

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()), // Provider pour la recherche
        ChangeNotifierProvider(create: (_) => FavoriteProvider()), // Ajout du FavoriteProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestion de Films',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
