import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../services/audio_service.dart';
import 'aboutus/aboutgame.dart';
import 'setting/setting.dart';
import 'contact/contact.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final _audioService = AudioService();
  late Future<void> _audioInitialization;

  @override
  void initState() {
    super.initState();
    _audioInitialization = _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      debugPrint('Initializing audio in MenuScreen...');
      await _audioService.initialize();
      await Future.delayed(
          const Duration(milliseconds: 500)); // Add small delay
      await _audioService.playLoopedAudio('assets/audio/laughing2.mp3');
      debugPrint('Audio initialization completed in MenuScreen');
    } catch (e) {
      debugPrint('Error initializing audio in MenuScreen: $e');
    }
  }

  @override
  void dispose() {
    debugPrint('Disposing MenuScreen...');
    _audioService.stopAudio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonHeight = screenSize.height * 0.08;
    final spacing = screenSize.height * 0.02;
    final imageSize = screenSize.width * 0.8;

    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: _audioInitialization,
          builder: (context, snapshot) {
            return Stack(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.05,
                        vertical: screenSize.height * 0.02,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Troll_Face.gif',
                            height: imageSize,
                            width: imageSize,
                          ),
                          SizedBox(height: spacing),
                          CustomButton(
                            text: 'លេងថ្មី',
                            onPressed: () {},
                            height: buttonHeight,
                          ),
                          SizedBox(height: spacing),
                          CustomButton(
                            text: 'លេងត',
                            onPressed: () {},
                            height: buttonHeight,
                          ),
                          SizedBox(height: spacing),
                          CustomButton(
                            text: 'ការកំណត់',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SettingScreen(),
                                ),
                              );
                            },
                            height: buttonHeight,
                          ),
                          SizedBox(height: spacing),
                          CustomButton(
                            text: 'អំពីហ្គេម',
                            onPressed: () {
                              _audioService.stopAudio();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AboutGameScreen(),
                                ),
                              ).then((_) {
                                _audioService.playLoopedAudio(
                                    'assets/audio/laughing2.mp3');
                              });
                            },
                            height: buttonHeight,
                          ),
                          SizedBox(height: spacing),
                          CustomButton(
                            text: 'ទំនាក់ទំនង',
                            onPressed: () {
                              _audioService.stopAudio();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ContactScreen(),
                                ),
                              ).then((_) {
                                _audioService.playLoopedAudio(
                                    'assets/audio/laughing2.mp3');
                              });
                            },
                            height: buttonHeight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
