import 'package:flutter/material.dart';

import 'package:lightsaber_app/constants/app_constants.dart';

/// Widget that displays the Star Wars "Hello there" image.
class StarWarsLogo extends StatelessWidget {
  /// Creates a [StarWarsLogo] widget.
  const StarWarsLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Image.asset(
        AppConstants.starWarsLogoImage,
        height: 120,
        fit: BoxFit.contain,
      ),
    );
  }
}
