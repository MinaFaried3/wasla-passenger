import 'package:wasla/app/shared/common/common_libs.dart';

class ConnectionDialogContent extends StatelessWidget {
  const ConnectionDialogContent({
    super.key,
    required this.text,
    required this.editButtonText,
    required this.connection,
    required this.onEditPressed,
    required this.onVerifyPressed,
  });

  final String text;
  final String editButtonText;
  final String connection;
  final Function() onEditPressed;
  final Function() onVerifyPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text.tr(),
          style: getBoldStyle(fontSize: FontSize.s20.sp),
        ),
        FittedBox(
          child: Text(connection,
              style: getMediumStyle(
                color: ColorsManager.offWhite500,
                fontSize: FontSize.s18.sp,
              )),
        ),
        VerticalSpace(AppSize.s20.h),
        OutlinedButton(
            style: ButtonStyle(
              fixedSize: MaterialStatePropertyAll(
                Size(AppSize.s220.w, AppSize.s20.h),
              ),
            ),
            onPressed: onEditPressed,
            child: Text(
              editButtonText.tr(),
            )),
        OutlinedButton(
            style: ButtonStyle(
              fixedSize: MaterialStatePropertyAll(
                Size(AppSize.s220.w, AppSize.s20.h),
              ),
            ),
            onPressed: onVerifyPressed,
            child: Text(
              AppStrings.verifyNow.tr(),
            )),
      ],
    );
  }
}
