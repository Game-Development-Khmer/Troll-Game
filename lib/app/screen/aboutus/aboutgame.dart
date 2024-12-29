import 'package:flutter/material.dart';
import 'aboutme.dart';


class AboutGameScreen extends StatefulWidget {
  const AboutGameScreen({super.key});

  @override
  State<AboutGameScreen> createState() => _AboutGameScreenState();
}

class _AboutGameScreenState extends State<AboutGameScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'អំពីហ្គេម',
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenSize.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: screenSize.width * 0.4,
                height: screenSize.width * 0.4,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Cheu Khuar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'ហ្គេមនេះត្រូវបានបង្កើតឡើងដើម្បីកម្សាន្ត និងបង្កើនការប្រើប្រាស់ខួរក្បាល។ វាមានសំណួរចំនួន១០០ ដែលនឹងធ្វើឲ្យអ្នកពិបាកឆ្លើយ និងគិត។',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
                fontFamily: 'Troll',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'របៀបលេង:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Troll',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '១. ជ្រើសរើសកម្រិតលំបាក\n'
              '២. អានសំណួរឲ្យបានយល់ច្បាស់\n'
              '៣. ព្យាយាមឆ្លើយសំណួរឲ្យត្រូវ\n'
              '៤. ប្រសិនបើឆ្លើយខុស អ្នកនឹងត្រូវចាប់ផ្តើមម្តងទៀត',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
                fontFamily: 'Troll',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'កំណែ: 1.0.0',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'យើងខ្ញុំសូមអភ័យទោសប្រសិនបើមានកំហុសឆ្គងដោយអចេតនាណាមួយក្នុងហ្គេមនេះ។ យើងខ្ញុំនឹងខិតខំកែលម្អជានិច្ច។',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontFamily: 'Troll',
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutMeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  'អំពីអ្នកបង្កើត',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Troll',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
