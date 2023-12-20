import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';
import 'package:wasla/presentation/common/enums/button_type_enum.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/connection_dialog_content.dart';
import 'package:wasla/presentation/modules/account_verification/verification_way/widgets/empty_connection_dialog_content.dart';
import 'package:wasla/presentation/widgets/dialog.dart';

class VerificationButtons extends StatefulWidget {
  final Connections connections;

  const VerificationButtons({super.key, required this.connections});

  @override
  State<VerificationButtons> createState() => _VerificationButtonsState();
}

class _VerificationButtonsState extends State<VerificationButtons>
    with TickerProviderStateMixin {
  late final AnimationController firstAnimationController;
  late final AnimationController secondAnimationController;

  late Animation<Offset> firstAnimation;
  late Animation<Offset> secondAnimation;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    firstAnimationController = AnimationController(
        vsync: this,
        duration: DurationManager.s2,
        lowerBound: 0,
        upperBound: 1);
    secondAnimationController =
        AnimationController(vsync: this, duration: DurationManager.s3);

    firstAnimation = Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: firstAnimationController, curve: Curves.ease));
    secondAnimation = Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: secondAnimationController, curve: Curves.ease));

    // firstAnimationController.addListener(_firstAnimationListener);
    firstAnimationController.forward();
    secondAnimationController.forward();
  }

  @override
  void dispose() {
    // firstAnimationController.removeListener(_firstAnimationListener);
    firstAnimationController.dispose();
    secondAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideTransition(
          position: firstAnimation,
          child: AppButton.dark(
            buttonType: ButtonContentType.iconText,
            svgIconPath: AssetsProvider.emailIcon,
            text: AppStrings.verifyWithEmail.tr(),
            onPressed: () => verifyEmailOnPressed(context),
          ),
        ),
        VerticalSpace(AppSize.s20.h),
        SlideTransition(
          position: secondAnimation,
          child: AppButton.dark(
            buttonType: ButtonContentType.iconText,
            svgIconPath: AssetsProvider.phoneIcon,
            text: AppStrings.verifyWithPhone.tr(),
            onPressed: () => verifyPhoneOnPressed(context),
          ),
        ),
      ],
    );
  }

  void verifyEmailOnPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          if (widget.connections.email.isEmpty) {
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
                    connection: widget.connections.email,
                    editButtonText: AppStrings.editYourEmail,
                    onEditPressed: () {
                      context.pushNamed(Routes.editEmailRoute.path);
                    },
                    onVerifyPressed: () {
                      context.pushNamed(Routes.verifyEmailRoute.path);
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
          if (widget.connections.phone.isEmpty) {
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
                    connection: widget.connections.phone,
                    editButtonText: AppStrings.editYourPhone,
                    onEditPressed: () {
                      context.pushNamed(Routes.editPhoneRoute.path);
                    },
                    onVerifyPressed: () {
                      context.pushNamed(Routes.verifyPhoneRoute.path);
                    },
                  ),
                ));
          }
        });
  }
}
