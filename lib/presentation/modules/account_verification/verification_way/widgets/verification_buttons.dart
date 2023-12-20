import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/connection_dialog_content.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/empty_connection_dialog_content.dart';
import 'package:wasla/presentation/widgets/dialog.dart';

class VerificationButtons extends StatelessWidget {
  final Connections connections;

  const VerificationButtons({super.key, required this.connections});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton.dark(
          buttonType: ButtonType.iconText,
          svgIconPath: AssetsProvider.emailIcon,
          text: AppStrings.verifyWithEmail.tr(),
          onPressed: () => verifyEmailOnPressed(context),
        ),
        VerticalSpace(AppSize.s20.h),
        AppButton.dark(
          buttonType: ButtonType.iconText,
          svgIconPath: AssetsProvider.phoneIcon,
          text: AppStrings.verifyWithPhone.tr(),
          onPressed: () => verifyPhoneOnPressed(context),
        ),
      ],
    );
  }

  void verifyEmailOnPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          if (connections.email.isEmpty) {
            return AppDialog(
              child: Center(
                child: EmptyConnectionDialogContent.email(),
              ),
            );
          } else {
            return AppDialog(
                height: 250.h,
                child: Center(
                  child: ConnectionDialogContent(
                    text: AppStrings.yourEmailIs,
                    connection: connections.email,
                    editButtonText: AppStrings.editYourEmail,
                    onEditPressed: () {
                      //todo
                    },
                    onVerifyPressed: () {
                      //todo
                    },
                  ),
                ));
          }
        });
  }

  void verifyPhoneOnPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          if (connections.phone.isEmpty) {
            return AppDialog(
              child: Center(
                child: EmptyConnectionDialogContent.phone(),
              ),
            );
          } else {
            return AppDialog(
                height: 250.h,
                child: Center(
                  child: ConnectionDialogContent(
                    text: AppStrings.yourPhoneIs,
                    connection: connections.phone,
                    editButtonText: AppStrings.editYourPhone,
                    onEditPressed: () {
                      //todo
                    },
                    onVerifyPressed: () {
                      //todo
                    },
                  ),
                ));
          }
        });
  }
}
