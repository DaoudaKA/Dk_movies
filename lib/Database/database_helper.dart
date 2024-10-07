import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'favorites.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY, title TEXT, image TEXT, synopsis TEXT, releaseDate TEXT)',
        );
      },
    );
  }

  Future<void> insertFavorite(Map<String, String> movie) async {
    final db = await database;
    await db.insert('favorites', movie, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteFavorite(String title) async {
    final db = await database;
    await db.delete('favorites', where: 'title = ?', whereArgs: [title]);
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await database;
    return await db.query('favorites');
  }
}
