import 'package:flutter/material.dart';
import 'app/app.dart';
import 'services/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Test database connection
  final isDatabaseConnected = await DatabaseService.testConnection();
  debugPrint('Database connected: $isDatabaseConnected');

  runApp(const App());
}
