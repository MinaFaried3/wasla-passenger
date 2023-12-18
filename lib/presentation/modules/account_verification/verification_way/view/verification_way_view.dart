import 'package:flutter/services.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widget/otp_lottie.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widget/titles.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widget/verification_buttons.dart';
import 'package:wasla/presentation/widgets/space.dart';

class VerificationWayScreen extends StatelessWidget {
  const VerificationWayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context);
    return PopScope(
      onPopInvoked: (canPop) => SystemNavigator.pop(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: responsive.appBarHeight,
          automaticallyImplyLeading: false,
          actions: [buildSkipButton()],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Tittles(),
              VerticalSpace(AppSize.s20.h),
              const OtpLottie(),
              const VerificationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildSkipButton() {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: AppPadding.p18.sp),
      child: TextButton(
        onPressed: () {
          //todo
        },
        child: Text(
          AppStrings.skip.tr(),
          style: getSemiBoldStyle(
            color: ColorsManager.tealPrimary1000,
            fontSize: FontSize.s24.sp,
          ),
        ),
      ),
    );
  }
}
