import 'dart:async';

import 'package:flutter/services.dart';
import 'package:neon_lightsaber_app/constants/app_constants.dart';
import 'package:sensors_plus/sensors_plus.dart';

/// Helper class for managing accelerometer-based shake detection.
class AccelerometerHelper {
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  bool _isShaking = false;
  DateTime _lastShakeTime = DateTime.now();

  /// Callback function to be called when shake is detected.
  final VoidCallback? onShakeDetected;

  /// Creates an [AccelerometerHelper] with optional shake detection callback.
  AccelerometerHelper({this.onShakeDetected});

  /// Sets up the accelerometer listener for shake detection.
  void setupAccelerometer() {
    _accelerometerSubscription = accelerometerEventStream().listen((
      AccelerometerEvent event,
    ) {
      final double acceleration = event.x.abs() + event.y.abs() + event.z.abs();

      if (acceleration > AppConstants.shakeThreshold) {
        final DateTime now = DateTime.now();
        if (now.difference(_lastShakeTime).inMilliseconds >
            AppConstants.shakeDetectionCooldownMs) {
          _lastShakeTime = now;
          _handleShakeDetected();
        }
      }
    });
  }

  /// Handles shake detection logic.
  void _handleShakeDetected() {
    if (!_isShaking) {
      _isShaking = true;

      // Provide haptic feedback
      HapticFeedback.heavyImpact();

      // Notify callback
      onShakeDetected?.call();

      // Reset shake state after a delay
      Timer(AppConstants.shakeResetDuration, () {
        _isShaking = false;
      });
    }
  }

  /// Disposes of the accelerometer subscription.
  void dispose() {
    _accelerometerSubscription?.cancel();
  }

  /// Gets the current shaking state.
  bool get isShaking => _isShaking;
}
