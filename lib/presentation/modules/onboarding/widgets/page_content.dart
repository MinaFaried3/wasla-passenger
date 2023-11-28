import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/onboarding/widgets/skip_button.dart';

class PageContent extends StatelessWidget {
  final OnboardingModel content;

  const PageContent({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context, hasAppBar: false);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkipButton(textColor: content.nextColor),
            responsive.heightSpace(3),
            Text(
              content.title,
              style: getBoldStyle(
                  fontSize: FontSize.s40.sp, color: ColorsManager.offWhite300),
            ),
            responsive.heightSpace(2),
            Text(
              content.subTitle,
              style: getMediumStyle(
                  color: ColorsManager.offWhite300, fontSize: FontSize.s26.sp),
            ),
            responsive.heightSpace(7),
            Center(
              child: Center(
                child: Image.asset(
                  content.image,
                  width: responsive.screenWidth * AppSize.s0_9,
                  height: responsive.bodyHeight * AppSize.s0_5,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
