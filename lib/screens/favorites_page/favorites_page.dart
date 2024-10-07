

import 'package:flutter/material.dart';
import 'package:movie/providers/favorite_provider.dart';
import 'package:movie/screens/favorites_page/movie_card.dart';
import 'package:movie/screens/home_page/detail_movie.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteMovies = Provider.of<FavoriteProvider>(context).favoriteMovies;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Films Favoris'),
      ),
      body: favoriteMovies.isEmpty
          ? const Center(child: Text('Aucun film favori pour le moment'))
          : ListView.builder(
              itemCount: favoriteMovies.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: favoriteMovies[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailMovie(movie: favoriteMovies[index]), // Naviguer vers la page de détails
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home_page()),
          );
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
