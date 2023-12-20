import 'package:flutter/services.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/otp_lottie.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/titles.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/verification_buttons.dart';

class VerificationWayScreen extends StatelessWidget {
  final Connections connections;

  const VerificationWayScreen({super.key, required this.connections});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context);
    PrintManager.print(connections.toString());
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
              VerticalSpace(AppSize.s50.h),
              VerificationButtons(
                connections: connections,
              ),
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
