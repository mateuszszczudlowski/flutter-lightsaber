import 'package:flutter/material.dart';

import 'package:neon_lightsaber_app/constants/app_constants.dart';

/// Widget that displays the lightsaber with blade and hilt.
class LightsaberWidget extends StatelessWidget {
  /// Creates a [LightsaberWidget].
  const LightsaberWidget({
    required this.bladeAnimation,
    required this.glowAnimation,
    required this.neonColor,
    required this.isBladeIgnited,
    required this.onTap,
    super.key,
  });

  /// Animation for the blade extension/retraction.
  final Animation<double> bladeAnimation;

  /// Animation for the glow effect.
  final Animation<double> glowAnimation;

  /// Current neon color of the lightsaber.
  final Color neonColor;

  /// Whether the blade is currently ignited.
  final bool isBladeIgnited;

  /// Callback when the lightsaber is tapped.
  final VoidCallback onTap;

  /// Cached shadow calculations for performance optimization.
  List<BoxShadow> _buildBladeShadows(double glowValue, Color color) {
    if (!isBladeIgnited) return [];
    
    return [
      BoxShadow(
        color: color,
        blurRadius: 20 * glowValue,
        spreadRadius: 3 * glowValue,
      ),
      BoxShadow(
        color: color.withValues(alpha: 0.5),
        blurRadius: 40 * glowValue,
        spreadRadius: 6 * glowValue,
      ),
      BoxShadow(
        color: Colors.white,
        blurRadius: 5 * glowValue,
        spreadRadius: 1,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Combine both animations into a single AnimatedBuilder for better performance
    return AnimatedBuilder(
      animation: Listenable.merge([bladeAnimation, glowAnimation]),
      builder: (context, child) {
        final double glowValue = glowAnimation.value;
        final double bladeValue = bladeAnimation.value;
        
        return Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              // Lightsaber Blade with RepaintBoundary for performance
              RepaintBoundary(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: AppConstants.bladeHeight * bladeValue,
                  width: AppConstants.bladeWidth + (8 * glowValue),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        neonColor,
                        neonColor.withValues(alpha: 0.8),
                      ],
                    ),
                    boxShadow: _buildBladeShadows(glowValue, neonColor),
                  ),
                ),
              ),
              // Lightsaber Hilt with RepaintBoundary for performance
              RepaintBoundary(
                child: GestureDetector(
                  onTap: onTap,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Container(
                    width: AppConstants.hiltWidth,
                    height: AppConstants.hiltHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF2C2C2C),
                          Color(0xFF5C5C5C),
                          Color(0xFF8C8C8C),
                          Color(0xFF5C5C5C),
                          Color(0xFF2C2C2C),
                        ],
                      ),
                      border: Border.all(
                        color: const Color(0xFF888888),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Top section with activation button
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            shape: BoxShape.circle,
                          ),
                        ),
                        // Metallic bands
                        ...List.generate(
                          3,
                          (index) => Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        // Power indicator
                        Container(
                          width: 30,
                          height: 6,
                          decoration: BoxDecoration(
                            color: isBladeIgnited ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: isBladeIgnited
                                ? [
                                    const BoxShadow(
                                      color: Colors.green,
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                    ),
                                  ]
                                : [],
                          ),
                        ),
                        // Bottom grip
                        Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
