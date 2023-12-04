import 'package:wasla/app/shared/common/common_libs.dart';

class AuthProviders extends StatelessWidget {
  const AuthProviders({super.key});

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
    final double width = responsiveManager.getWidthOf(AppSize.s0_1);
    final double iconWidth = width * AppSize.s0_65;
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveManager.getWidthOf(AppSize.s0_0075),
        ),
        child: IconButton(
          style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll(ColorsManager.darkTeal),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s10),
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
            colorFilter: const ColorFilter.mode(
              ColorsManager.offWhite400,
              BlendMode.srcIn,
            ),
          ),
        ));
  }
}
