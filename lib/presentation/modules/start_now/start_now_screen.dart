import 'package:wasla/presentation/resources/common/common_libs.dart';

class StartNowScreen extends StatelessWidget {
  const StartNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          ImageAssets.arrowDown1,
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}
