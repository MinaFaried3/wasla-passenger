import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/widgets/space.dart';

class VerificationButtons extends StatelessWidget {
  const VerificationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
            buttonType: ButtonType.iconText,
            svgIconPath: AssetsProvider.emailIcon,
            text: AppStrings.verifyWithEmail.tr(),
            onPressed: () {}),
        VerticalSpace(AppSize.s20.h),
        AppButton(
            buttonType: ButtonType.iconText,
            svgIconPath: AssetsProvider.phoneIcon,
            text: AppStrings.verifyWithPhone.tr(),
            onPressed: () {}),
      ],
    );
  }
}
