import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  AudioPlayer? _audioPlayer;
  bool _isInitialized = false;

  factory AudioService() {
    return _instance;
  }

  AudioService._internal();

  Future<void> initialize() async {
    if (!_isInitialized) {
      debugPrint('Initializing AudioService...');
      _audioPlayer?.dispose();
      _audioPlayer = AudioPlayer();
      _isInitialized = true;
      debugPrint('AudioService initialized');
    }
  }

  Future<void> playLoopedAudio(String assetPath) async {
    try {
      if (_audioPlayer == null || !_isInitialized) {
        debugPrint('AudioPlayer not initialized, initializing...');
        await initialize();
      }

      final player = _audioPlayer!;
      final path = assetPath.replaceFirst('assets/', '');
      debugPrint('Playing audio: $path');

      await player.stop(); // Stop any currently playing audio
      await player.setSourceAsset(path);
      await player.setReleaseMode(ReleaseMode.loop);
      await player.setVolume(1.0); // Ensure volume is up

      await player.resume();
      debugPrint('Audio started playing');
    } catch (e) {
      debugPrint('Error playing audio: $e');
      debugPrint('Stack trace: ${StackTrace.current}');
    }
  }

  Future<void> stopAudio() async {
    try {
      debugPrint('Stopping audio...');
      await _audioPlayer?.stop();
    } catch (e) {
      debugPrint('Error stopping audio: $e');
    }
  }

  void dispose() {
    debugPrint('Disposing AudioService...');
    _audioPlayer?.dispose();
    _audioPlayer = null;
    _isInitialized = false;
  }
}
