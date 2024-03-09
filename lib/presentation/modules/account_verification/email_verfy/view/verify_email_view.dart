import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/resend_code_again.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/scale_img.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/verification_code_fields.dart';
import 'package:wasla/presentation/modules/account_verification/widgets/titles.dart';
import 'package:wasla/presentation/widgets/app_bar_back_button.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String email;

  const VerifyEmailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //back button
                  const AppBarBackButton(),

                  //titles
                  const Titles(
                    title: AppStrings.enterVerificationCode,
                    subTitle: AppStrings.codeHasBeenSent,
                  ),

                  const ScaleImage(path: AssetsProvider.enterVerificationCode),

                  //code form field
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: const VerificationCodeFields(),
                  ),

                  VerticalSpace(50.h),

                  //resend code
                  const ResendCodeAgain()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
