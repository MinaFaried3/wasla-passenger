import 'package:wasla/app/shared/common/common_libs.dart';

class LoginProviders extends StatelessWidget {
  const LoginProviders({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.ltr,
      children: [
        _buildProviderElement(
            icon: AssetsProvider.facebookIcon,
            responsiveManager: responsive,
            onPressed: () {}),
        _buildProviderElement(
            icon: AssetsProvider.googleIcon,
            responsiveManager: responsive,
            onPressed: () {}),
        _buildProviderElement(
            icon: AssetsProvider.appleIcon,
            responsiveManager: responsive,
            onPressed: () {}),
      ],
    );
  }

  Widget _buildProviderElement(
      {required String icon,
      required ResponsiveManager responsiveManager,
      required void Function() onPressed}) {
    final double width = responsiveManager.getWidthOf(AppSize.s0_125);
    final double iconWidth = width * AppSize.s0_65;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveManager.getWidthOf(AppSize.s0_015),
      ),
      child: IconButton(
        style: ButtonStyle(
          backgroundColor:
              const MaterialStatePropertyAll(ColorsManager.darkTeal),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
          ),
          fixedSize: MaterialStatePropertyAll(
            Size(width, width),
          ),
        ),
        onPressed: onPressed,
        icon: SvgPicture.asset(
          icon,
          width: iconWidth,
          height: iconWidth,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
