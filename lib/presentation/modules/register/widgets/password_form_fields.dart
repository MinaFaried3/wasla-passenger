import 'package:wasla/app/shared/common/common_libs.dart';

class PasswordFormFields extends StatelessWidget {
  const PasswordFormFields({super.key, required this.passwordFormKey});

  final GlobalKey<FormState> passwordFormKey;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);

    //bottom padding
    final double paddingBottom = responsive.getScreenHeightOf(AppSize.s0_03);
    final edgeInsetsBottom = EdgeInsets.only(bottom: paddingBottom);
    return Form(
      key: passwordFormKey,
      child: Column(
        children: [
          //password field
          Padding(
            padding: edgeInsetsBottom,
            child: AppTextFormField(
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.done,
              labelText: AppStrings.password.tr(),
              svgPrefixPath: AssetsProvider.passwordIcon,
              isPassword: true,
            ),
          ),

          //confirm password field
          Padding(
            padding: edgeInsetsBottom,
            child: AppTextFormField(
              textDirection: TextDirection.ltr,
              textInputAction: TextInputAction.done,
              labelText: AppStrings.confirmPassword.tr(),
              svgPrefixPath: AssetsProvider.passwordIcon,
              isPassword: true,
              suffix: SvgPicture.asset(
                AssetsProvider.doneIcon,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  ColorsManager.offWhite300.withOpacity(AppSize.s0_9),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
