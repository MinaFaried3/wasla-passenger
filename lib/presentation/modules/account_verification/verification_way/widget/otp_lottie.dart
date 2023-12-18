import 'package:lottie/lottie.dart';
import 'package:wasla/app/shared/common/common_libs.dart';

class OtpLottie extends StatelessWidget {
  const OtpLottie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveManager(context);
    return Padding(
      padding: EdgeInsets.only(left: AppPadding.p8.w),
      child: Lottie.asset(
        AssetsProvider.otp,
        alignment: Alignment.center,
        height: responsive.getBodyHeightPercentage(40),
        width: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}
