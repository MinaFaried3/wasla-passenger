import 'package:wasla/app/shared/common/common_libs.dart';

class ResendCodeAgain extends StatelessWidget {
  const ResendCodeAgain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.doNotReceiveCode.tr(),
          style: getRegularStyle(
              fontSize: FontSize.s16.sp, color: ColorsManager.grey700),
        ),
        const HorizontalSpace(5),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            foregroundColor:
                const MaterialStatePropertyAll(ColorsManager.tealPrimary900),
            textStyle: MaterialStatePropertyAll(
              getRegularStyle(
                fontSize: FontSize.s16.sp,
              ),
            ),
          ),
          child: Text(
            AppStrings.resendAgain.tr(),
          ),
        )
      ],
    );
  }
}
