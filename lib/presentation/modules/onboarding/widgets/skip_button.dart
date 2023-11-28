import 'package:wasla/app/shared/common/common_libs.dart';

class SkipButton extends StatelessWidget {
  final Color textColor;

  const SkipButton({
    super.key,
    required this.textColor,
  });

  void _onFinish(BuildContext context) {
    context.pushReplacementNamed(RoutesStrings.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _onFinish(context);
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
