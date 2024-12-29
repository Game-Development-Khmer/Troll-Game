import 'package:flutter/material.dart';
import 'screen/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Precache images for better performance
    precacheImage(const AssetImage('assets/images/facehomepage.png'), context);
    precacheImage(const AssetImage('assets/images/brain.png'), context);

    return MaterialApp(
      title: 'Cheu Khuar',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
