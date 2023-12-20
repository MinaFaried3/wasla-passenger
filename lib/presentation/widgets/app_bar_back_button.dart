import 'package:wasla/app/shared/common/common_libs.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.pop();
        },
        icon: SvgPicture.asset(
          AssetsProvider.arrowBackIcon,
          matchTextDirection: true,
        ));
  }
}
