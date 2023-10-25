import 'package:flutter/material.dart';
import 'package:wasla/presentation/resources/assets_manager.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageAssets.logo,
          width: 300,
          height: 600,
        ),
      ),
    );
  }
}
