import 'package:flutter/material.dart';
import 'package:movie/models/movie_service.dart';


class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap; // Paramètre pour gérer le clic

  const MovieCard({Key? key, required this.movie, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backDropPath = movie.image.isNotEmpty
        ? "https://image.tmdb.org/t/p/w500/${movie.image}"
        : 'https://via.placeholder.com/150'; // Image par défaut si vide

    return GestureDetector( // Utilisation de GestureDetector pour gérer le clic
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                backDropPath,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.error));
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title.isNotEmpty ? movie.title : "Titre indisponible",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    movie.releaseDate ?? "Date de sortie indisponible",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    movie.image ?? "Aperçu indisponible",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
