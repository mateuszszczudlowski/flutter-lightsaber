import 'package:audioplayers/audioplayers.dart';

import 'package:lightsaber_app/constants/app_constants.dart';

/// Helper class for managing lightsaber audio effects.
class AudioHelper {
  late AudioPlayer _audioPlayer;

  /// Creates an [AudioHelper] and initializes the audio player.
  AudioHelper() {
    _audioPlayer = AudioPlayer();
  }

  /// Plays the lightsaber ignition sound effect.
  Future<void> playIgnitionSound() async {
    try {
      await _audioPlayer.play(
        AssetSource(AppConstants.lightsaberIgnitionSound),
      );
    } catch (e) {
      // Handle audio playback error silently
      // In a production app, you might want to log this error
    }
  }

  /// Plays the lightsaber swing sound effect.
  Future<void> playSwingSound() async {
    try {
      await _audioPlayer.play(AssetSource(AppConstants.lightsaberSwingSound));
    } catch (e) {
      // Handle audio playback error silently
      // In a production app, you might want to log this error
    }
  }

  /// Disposes of the audio player resources.
  void dispose() {
    _audioPlayer.dispose();
  }
}
