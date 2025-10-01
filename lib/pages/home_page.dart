import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lightsaber_app/constants/app_constants.dart';
import 'package:lightsaber_app/helpers/accelerometer_helper.dart';
import 'package:lightsaber_app/helpers/audio_helper.dart';
import 'package:lightsaber_app/helpers/color_generator.dart';
import 'package:lightsaber_app/widgets/lightsaber_widget.dart';
import 'package:lightsaber_app/widgets/star_wars_logo.dart';

/// Home page widget that displays the lightsaber interface.
class LightsaberHomePage extends StatefulWidget {
  /// Creates a [LightsaberHomePage].
  const LightsaberHomePage({super.key});

  @override
  State<LightsaberHomePage> createState() => _LightsaberHomePageState();
}

class _LightsaberHomePageState extends State<LightsaberHomePage>
    with TickerProviderStateMixin {
  late AnimationController _glowController;
  late AnimationController _bladeController;
  late Animation<double> _glowAnimation;
  late Animation<double> _bladeAnimation;

  Color _neonColor = AppConstants.defaultNeonColor;
  bool _isBladeIgnited = false;

  // Helper instances
  late AccelerometerHelper _accelerometerHelper;
  late AudioHelper _audioHelper;

  bool _isOnCooldown = false;
  Timer? _cooldownTimer;

  @override
  void initState() {
    super.initState();

    // Initialize glow animation for neon text
    _glowController = AnimationController(
      duration: AppConstants.glowAnimationDuration,
      vsync: this,
    );
    _glowAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    // Initialize blade animation
    _bladeController = AnimationController(
      duration: AppConstants.bladeAnimationDuration,
      vsync: this,
    );
    _bladeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _bladeController, curve: Curves.easeOutCubic),
    );

    // Initialize helper classes
    _audioHelper = AudioHelper();
    _accelerometerHelper = AccelerometerHelper(
      onShakeDetected: _onShakeDetected,
    );

    // Start the glow animation
    _glowController.repeat(reverse: true);

    // Setup accelerometer listener
    _accelerometerHelper.setupAccelerometer();
  }

  void _onShakeDetected() {
    // Play swing sound only when blade is ignited
    if (_isBladeIgnited) {
      _audioHelper.playSwingSound();
    }
  }

  void _changeColors() {
    // Check if on cooldown
    if (_isOnCooldown) {
      return;
    }

    setState(() {
      _isBladeIgnited = !_isBladeIgnited;
      if (_isBladeIgnited) {
        // Generate a truly random RGB color
        _neonColor = ColorGenerator.generateLightsaberColor();
      }
    });

    if (_isBladeIgnited) {
      _bladeController.forward();
      _audioHelper.playIgnitionSound();
    } else {
      _bladeController.reverse();
    }

    // Set cooldown to prevent rapid toggling
    _isOnCooldown = true;
    _cooldownTimer = Timer(AppConstants.cooldownDuration, () {
      _isOnCooldown = false;
    });
  }

  void _onScreenTap() {
    _changeColors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: GestureDetector(
        onTap: _onScreenTap,
        child: Stack(
          children: [
            const Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: StarWarsLogo(),
              ),
            ),
            Positioned(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LightsaberWidget(
                      bladeAnimation: _bladeAnimation,
                      glowAnimation: _glowAnimation,
                      neonColor: _neonColor,
                      isBladeIgnited: _isBladeIgnited,
                      onTap: _changeColors,
                    ),
                  ],
                ),
              ),
            ),
            // Instructional text
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  AppConstants.instructionalText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    _bladeController.dispose();
    _accelerometerHelper.dispose();
    _audioHelper.dispose();
    _cooldownTimer?.cancel();
    super.dispose();
  }
}
