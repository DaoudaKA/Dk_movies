import 'package:flutter/material.dart';
import 'package:movie/models/movie_service.dart';
import 'package:movie/pages/video_player.dart';
import 'package:movie/providers/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'detail_movie.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Map<String, String>>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 3, 24, 49),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildSection('Découvrir', futureMovies),
            _buildSection('Nouveautés', futureMovies),
            _buildSection('Populaires', futureMovies),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      String title, Future<List<Map<String, String>>> futureMovies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        SizedBox(
          height: 400,
          child: FutureBuilder<List<Map<String, String>>>(
            future: futureMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final films = snapshot.data!;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 34.0,
                  ),
                  itemCount: films.length,
                  itemBuilder: (context, index) {
                    return _buildFilmItem(films[index], context);
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilmItem(Map<String, String> film, BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, favoriteProvider, child) {
        final isFavorite = favoriteProvider.isFavoritedByTitle(film['title']!);

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailMovie(
                  title: film['title']!,
                  image: film['image']!,
                  synopsis: film['synopsis']!,
                  releaseDate: film['releaseDate']!,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    film['image']!,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  film['title']!,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoPlayerPage(
                              videoUrl:
                                  'https://api.themoviedb.org/3/tv/series_id/season/season_number/episode/episode_number/videos?language=en-US',
                            ),
                          ),
                        );
                      },
                      child: Text('Jouer'),
                    ),
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                      onPressed: () {
                        favoriteProvider.toggleFavorite(
                          Movie(
                            title: film['title']!,
                            image: film['image']!,
                            synopsis: film['synopsis']!,
                            releaseDate: film['releaseDate']!,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
