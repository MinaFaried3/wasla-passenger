import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/widgets/space.dart';

part 'package:wasla/presentation/common/enums/button_type_enum.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final ButtonType buttonType;
  final String? svgIconPath;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.fontSize,
    this.buttonType = ButtonType.text,
    this.svgIconPath,
  });

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
        child: buildButtonChild(context));
  }

  Widget buildButtonChild(BuildContext context) {
    switch (buttonType) {
      case ButtonType.text:
        return buildText(context);
      case ButtonType.icon:
        return buildIcon(context);
      case ButtonType.iconText:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildIcon(context),
            HorizontalSpace(AppSize.s8.w),
            buildText(context),
          ],
        );
    }
  }

  Widget buildIcon(BuildContext context) => svgIconPath != null
      ? SvgPicture.asset(
          svgIconPath!,
          height: AppSize.s37_5.sp,
          matchTextDirection: true,
          colorFilter: const ColorFilter.mode(
            ColorsManager.tealPrimary800,
            BlendMode.srcIn,
          ),
        )
      : const SizedBox.shrink();

  Text buildText(BuildContext context) {
    return Text(
      text,
      style: buildStyle(context),
    );
  }

  TextStyle buildStyle(BuildContext context) {
    switch (buttonType) {
      case ButtonType.text:
        return getSemiBoldStyle(
            color: Theme.of(context).colorScheme.surfaceVariant,
            fontSize: fontSize ?? FontSize.s24.sp);
      case ButtonType.icon:
        return getSemiBoldStyle(
            color: Theme.of(context).colorScheme.surfaceVariant,
            fontSize: fontSize ?? FontSize.s24.sp);
      case ButtonType.iconText:
        return getLightStyle(
            color: Theme.of(context).colorScheme.surfaceVariant,
            fontSize: fontSize ?? FontSize.s24.sp);
    }
  }
}
