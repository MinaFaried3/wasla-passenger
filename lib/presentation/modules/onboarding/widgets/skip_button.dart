import 'package:wasla/app/shared/common/common_libs.dart';

class SkipButton extends StatelessWidget {
  final Color textColor;

  const SkipButton({
    super.key,
    required this.textColor,
    required this.onFinish,
  });

  final Function(BuildContext) onFinish;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onFinish(context);
      },
      child: Text(
        AppStrings.skip.tr(),
        style: getMediumStyle(
          color: textColor,
          fontSize: FontSize.s22.sp,
        ),
      ),
    );
  }
}
