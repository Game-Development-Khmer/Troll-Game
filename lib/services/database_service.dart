import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {
  static Database? _database;
  static bool _isDatabaseConnected = false;

  // Check if database is connected
  static bool get isDatabaseConnected => _isDatabaseConnected;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    try {
      debugPrint('Initializing database connection...');
      _database = await _initDatabase();
      _isDatabaseConnected = true;
      debugPrint('Database connected successfully!');
      return _database!;
    } catch (e) {
      _isDatabaseConnected = false;
      debugPrint('Failed to connect to database: $e');
      rethrow;
    }
  }

  static Future<Database> _initDatabase() async {
    try {
      String path = join(await getDatabasesPath(), 'cheu_khuar.db');
      debugPrint('Database path: $path');

      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          debugPrint('Creating new database...');
          await _onCreate(db, version);
          debugPrint('Database created successfully!');
        },
        onOpen: (db) {
          debugPrint('Database opened successfully!');
        },
      );
    } catch (e) {
      debugPrint('Error initializing database: $e');
      rethrow;
    }
  }

  // Test database connection
  static Future<bool> testConnection() async {
    try {
      final db = await database;
      // Try a simple query to test the connection
      await db.rawQuery('SELECT 1');
      debugPrint('Database connection test: SUCCESS');
      return true;
    } catch (e) {
      debugPrint('Database connection test: FAILED');
      debugPrint('Error: $e');
      return false;
    }
  }

  static Future<void> _onCreate(Database db, int version) async {
    // Questions table
    await db.execute('''
      CREATE TABLE questions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT NOT NULL,
        option1 TEXT NOT NULL,
        option2 TEXT NOT NULL,
        option3 TEXT NOT NULL,
        option4 TEXT NOT NULL,
        correct_answer INTEGER NOT NULL,
        difficulty INTEGER NOT NULL
      )
    ''');

    // User Progress table
    await db.execute('''
      CREATE TABLE user_progress(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        level INTEGER NOT NULL,
        score INTEGER NOT NULL,
        date_played TEXT NOT NULL
      )
    ''');

    // Insert some initial questions
    await db.insert('questions', {
      'question': 'សំណួរទី១',
      'option1': 'ជម្រើសទី១',
      'option2': 'ជម្រើសទី២',
      'option3': 'ជម្រើសទី៣',
      'option4': 'ជម្រើសទី៤',
      'correct_answer': 1,
      'difficulty': 1,
    });
  }

  // Get all questions for a specific difficulty
  static Future<List<Map<String, dynamic>>> getQuestions(int difficulty) async {
    try {
      final db = await database;
      final results = await db.query(
        'questions',
        where: 'difficulty = ?',
        whereArgs: [difficulty],
      );
      debugPrint(
          'Retrieved ${results.length} questions for difficulty $difficulty');
      return results;
    } catch (e) {
      debugPrint('Error getting questions: $e');
      rethrow;
    }
  }

  // Save user progress
  static Future<void> saveProgress(int level, int score) async {
    final db = await database;
    await db.insert('user_progress', {
      'level': level,
      'score': score,
      'date_played': DateTime.now().toIso8601String(),
    });
  }

  // Get highest score
  static Future<int> getHighestScore() async {
    final db = await database;
    final result = await db.rawQuery(
      'SELECT MAX(score) as max_score FROM user_progress',
    );
    return result.first['max_score'] as int? ?? 0;
  }

  // Get last played level
  static Future<int> getLastLevel() async {
    final db = await database;
    final result = await db.query(
      'user_progress',
      orderBy: 'date_played DESC',
      limit: 1,
    );
    return result.isEmpty ? 1 : result.first['level'] as int;
  }
}
