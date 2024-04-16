import 'package:wasla/app/shared/common/common_libs.dart';

class AppSvg extends StatelessWidget {
  const AppSvg({
    super.key,
    required this.path,
    this.fit,
    this.width,
    this.height,
    this.color = ColorsManager.offWhite,
    this.matchTextDirection = true,
  });

  final String path;
  final double? width, height;
  final Color color;
  final bool matchTextDirection;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(path,
        matchTextDirection: matchTextDirection,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ));
  }
}

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSvg(
            path: AssetsProvider.menuIcon,
            fit: BoxFit.scaleDown,
          ),
          AppSvg(
            path: AssetsProvider.menuIcon,
            fit: BoxFit.scaleDown,
          ),
        ],
      ),
    );
  }
}
