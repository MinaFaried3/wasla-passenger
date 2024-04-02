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
        Text(
          title.tr(),
          style: getBoldStyle(fontSize: FontSize.s18.sp),
        ),
        Text(caption.tr(), style: getMediumStyle(fontSize: FontSize.s16.sp)),
        VerticalSpace(AppSize.s20.h),
        OutlinedButton(
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
