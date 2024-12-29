import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../services/audio_service.dart';
import '../../widgets/shaking_widget.dart';
import '../../widgets/bgcolor.dart';
import 'menu.dart';
import '../../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _audioService = AudioService();
  bool _isShaking = false;
  AudioPlayer? _player;

  @override
  void dispose() {
    _player?.dispose();
    _audioService.dispose();
    super.dispose();
  }

  void _handleButtonPress() async {
    if (_isShaking) return; // Prevent multiple clicks

    setState(() {
      _isShaking = true;
    });

    try {
      _player = AudioPlayer();
      await _player!.setSourceAsset('audio/laughing1.mp3');

      // Set up the completion listener before playing
      _player!.onPlayerComplete.listen((_) {
        if (mounted) {
          // Check if widget is still mounted
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MenuScreen(),
            ),
          );
        }
      });

      // Play the audio
      await _player!.resume();
    } catch (e) {
      debugPrint('Error playing audio: $e');
      // Only navigate on error if the widget is still mounted
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MenuScreen(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageSize = screenSize.width * 0.8;
    final brainSize = screenSize.width * 0.3;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundColor(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.05,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenSize.height * 0.02),
                        if (_isShaking)
                          ShakingWidget(
                            child: _CachedImage(
                              path: 'assets/images/facehomepage.png',
                              width: imageSize,
                              height: imageSize,
                            ),
                          )
                        else
                          _CachedImage(
                            path: 'assets/images/facehomepage.png',
                            width: imageSize,
                            height: imageSize,
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _CachedImage(
                              path: 'assets/images/brain.png',
                              width: brainSize,
                              height: brainSize,
                            ),
                            Text(
                              'Cheu Khuar',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.06,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        Text(
                          'និងធ្វើឲ្យខួររបស់អ្នកឈឺចាប់!',
                          style: TextStyle(
                            fontSize: screenSize.width * 0.08,
                            color: Colors.white,
                            fontFamily: 'Troll',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenSize.height * 0.02,
                      horizontal: screenSize.width * 0.1,
                    ),
                    child: CustomButton(
                      height: screenSize.height * 0.08,
                      text: 'ចូលលេង',
                      onPressed: _handleButtonPress,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CachedImage extends StatelessWidget {
  const _CachedImage({
    required this.path,
    required this.width,
    required this.height,
  });

  final String path;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: BoxFit.contain,
      cacheWidth: (width * MediaQuery.of(context).devicePixelRatio).toInt(),
      cacheHeight: (height * MediaQuery.of(context).devicePixelRatio).toInt(),
      filterQuality: FilterQuality.medium,
    );
  }
}
