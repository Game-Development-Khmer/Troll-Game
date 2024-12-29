import 'package:flutter/material.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'អំពីអ្នកបង្កើត',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: screenSize.width * 0.2,
              backgroundImage: const AssetImage('assets/images/developer.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'ឈ្មោះ៖ ដុង ជេផាគ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Troll',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'អាយុ៖ ២៣ឆ្នាំ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Troll',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'ជំនាញ៖',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Troll',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '• Flutter Developer\n'
              '• Mobile App Developer\n'
              '• Web Developer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
                fontFamily: 'Troll',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'ទំនាក់ទំនង៖',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Troll',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'អ៊ីមែល៖ soksokha@gmail.com\n'
              'ទូរស័ព្ទ៖ 012 345 678\n'
              'តេឡេក្រាម៖ @soksokha',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.5,
                fontFamily: 'Troll',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'ខ្ញុំបាទមានក្តីរីករាយដែលបានបង្កើតហ្គេមនេះឡើង ដើម្បីរួមចំណែកក្នុងការអភិវឌ្ឍន៍វិស័យបច្ចេកវិទ្យានៅកម្ពុជា។',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                height: 1.5,
                fontFamily: 'Troll',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
