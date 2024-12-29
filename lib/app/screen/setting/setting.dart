import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double _volume = 0.5;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'ការកំណត់',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Troll',
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'កម្រិតសម្លេង',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Troll',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.volume_down, color: Colors.white),
                Expanded(
                  child: Slider(
                    value: _volume,
                    onChanged: (newValue) {
                      setState(() {
                        _volume = newValue;
                      });
                    },
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                  ),
                ),
                const Icon(Icons.volume_up, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
