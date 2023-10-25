import 'package:wasla/presentation/resources/common/common_libs.dart';

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
