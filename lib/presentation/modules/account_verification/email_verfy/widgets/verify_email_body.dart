import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/email_verfy/cubit/email_verify_cubit.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/resend_code_again.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/scale_img.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/verification_code_fields.dart';
import 'package:wasla/presentation/modules/account_verification/widgets/titles.dart';
import 'package:wasla/presentation/widgets/app_bar_back_button.dart';
import 'package:wasla/presentation/widgets/app_toast.dart';
import 'package:wasla/presentation/widgets/buttons/loading_button.dart';

class VerifyEmailBody extends StatefulWidget {
  const VerifyEmailBody({
    super.key,
  });

  @override
  State<VerifyEmailBody> createState() => _VerifyEmailBodyState();
}

class _VerifyEmailBodyState extends State<VerifyEmailBody> {
  final List<TextEditingController> digitsControllers = [
    for (var i = 0; i < AppConstants.otpCodeLength; i++) TextEditingController()
  ];
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _dispose() {
    for (var i = 0; i < AppConstants.otpCodeLength; i++) {
      digitsControllers[i].dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: key,
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
                  child: VerificationCodeFields(
                    digitsControllers: digitsControllers,
                  ),
                ),

                VerticalSpace(10.h),

                //resend code
                const ResendCodeAgain(),
                VerticalSpace(40.h),
                Padding(
                  padding: AppPadding.leftRight,
                  child: BlocConsumer<EmailVerifyCubit, EmailVerifyState>(
                    listener: verifyEmailListener,
                    builder: verifyEmailBuilder,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void verifyEmailListener(BuildContext context, EmailVerifyState state) {
    state.whenOrNull(
        confirmEmailErrorState: (errorMessage) => showAppToast(errorMessage),
        confirmEmailSuccessState: (message) {
          showAppToast(message);
          context.pushNamedAndRemoveUntil(Routes.start.path);
        });
  }

  Widget verifyEmailBuilder(BuildContext context, EmailVerifyState state) {
    return state.maybeWhen(
      confirmEmailLoadingState: () => LoadingButton.loading(),
      orElse: () => LoadingButton(
        text: AppStrings.verifyNow.tr(),
        onPressed: onPressedVerifyEmail,
      ),
    );
  }

  void onPressedVerifyEmail() {
    String verifyCode = '';
    for (var i = 0; i < AppConstants.otpCodeLength; i++) {
      //1- make sure no field is empty
      if (digitsControllers[i].text.isEmpty) {
        showAppToast(AppStrings.verificationCodeMustContain4digits.tr());
        return;
      }

      //2- gather the code
      verifyCode += digitsControllers[i].text;
    }

    if (verifyCode.length == AppConstants.otpCodeLength) {
      context.read<EmailVerifyCubit>().confirmEmail(verifyCode: verifyCode);
    }
  }
}
