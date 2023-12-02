import 'package:wasla/app/shared/common/common_libs.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? width;
  final double? height;

  const AppButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    final ResponsiveManager responsive = ResponsiveManager(context);
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.onSurface,
            ),
            foregroundColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.surfaceVariant,
            ),
            fixedSize: MaterialStatePropertyAll(
              Size(
                width ?? double.infinity,
                height ?? responsive.getBodyHeightOf(AppSize.s0_075),
              ),
            ),
            minimumSize: const MaterialStatePropertyAll(
              Size(AppSize.s100, AppSize.s40),
            ),
            maximumSize: const MaterialStatePropertyAll(
              Size(AppSize.s400, AppSize.s100),
            ),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s20)))),
        onPressed: onPressed,
        child: Text(text));
  }
}
