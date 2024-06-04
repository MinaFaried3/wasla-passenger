import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/enums/connection_type.dart';

class EmptyConnectionDialogContent extends StatelessWidget {
  const EmptyConnectionDialogContent._({
    required this.connectionType,
    required this.title,
    required this.caption,
    required this.buttonText,
  });

  final ConnectionType connectionType;

  factory EmptyConnectionDialogContent.email() =>
      const EmptyConnectionDialogContent._(
        connectionType: ConnectionType.email,
        title: AppStrings.unEnteredEmail,
        caption: AppStrings.pleaseEnterEmail,
        buttonText: AppStrings.enterEmail,
      );

  factory EmptyConnectionDialogContent.phone() =>
      const EmptyConnectionDialogContent._(
        connectionType: ConnectionType.phone,
        title: AppStrings.unEnteredPhone,
        caption: AppStrings.pleaseEnterPhone,
        buttonText: AppStrings.enterPhone,
      );

  final String title;
  final String caption;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text(
            title.tr(),
            style: getBoldStyle(fontSize: FontSize.s16.sp),
          ),
        ),
        VerticalSpace(5.h),
        Text(
          caption.tr(),
          style: getMediumStyle(fontSize: FontSize.s12.sp),
          textAlign: TextAlign.center,
        ),
        VerticalSpace(AppSize.s20.h),
        OutlinedButton(
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.all(8))),
            onPressed: () {
              switch (connectionType) {
                case ConnectionType.phone:
                  context.pop();
                  context.pushNamed(Routes.editPhoneRoute.path,
                      arguments: AppStrings.inputYourOwnPhone);
                  break;
                case ConnectionType.email:
                  context.pop();
                  context.pushNamed(Routes.editEmailRoute.path,
                      arguments: AppStrings.inputYourOwnEmail);
                  break;
              }
            },
            child: Text(
              buttonText.tr(),
            )),
      ],
    );
  }
}
