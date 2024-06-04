import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/email_verfy/cubit/email_verify_cubit.dart';
import 'package:wasla/presentation/modules/account_verification/email_verfy/widgets/verify_email_body.dart';
import 'package:wasla/presentation/widgets/app_toast.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<EmailVerifyCubit, EmailVerifyState>(
          listener: (context, state) {
            state.whenOrNull(sendingEmailSuccessState: () {
              showAppToast(AppStrings.verificationCodeSentToYourEmail.tr());
            }, sendingEmailErrorState: (error) {
              showAppToast(error);
              context.pop();
            });
          },
          builder: (context, state) {
            return state.maybeWhen(
              sendingEmailLoadingState: () => const LoadingIndicator(),
              orElse: () => const VerifyEmailBody(),
            );
          },
        ),
      ),
    );
  }
}
