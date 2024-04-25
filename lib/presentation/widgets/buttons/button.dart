import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/enums/button_type_enum.dart';
import 'package:wasla/presentation/widgets/buttons/buttons_methods.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? iconSize;
  final double? radius;
  final ButtonContentType buttonType;
  final String? svgIconPath;
  final Color? backgroundColor;
  final Color? fontColor;
  final Color? iconColor;
  final bool matchFontColor;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.fontSize,
    this.buttonType = ButtonContentType.text,
    this.svgIconPath,
    this.backgroundColor,
    this.fontColor,
    this.iconSize,
    this.matchFontColor = false,
    this.radius,
    this.iconColor,
  });

  factory AppButton.dark({
    required String text,
    required void Function() onPressed,
    double? width,
    double? height,
    double? fontSize,
    double? iconSize,
    ButtonContentType buttonType = ButtonContentType.text,
    String? svgIconPath,
    double? radius,
    bool matchFontColor = false,
  }) =>
      AppButton(
        text: text,
        onPressed: onPressed,
        fontColor: ColorsManager.offWhite,
        backgroundColor: ColorsManager.tealPrimary1000,
        height: height,
        width: width,
        svgIconPath: svgIconPath,
        buttonType: buttonType,
        fontSize: fontSize,
        iconSize: iconSize,
        matchFontColor: matchFontColor,
        radius: radius,
      );

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            backgroundColor ?? Theme.of(context).colorScheme.onSurface,
          ),
          foregroundColor: MaterialStatePropertyAll(
            fontColor ?? Theme.of(context).colorScheme.surfaceVariant,
          ),
          fixedSize: MaterialStatePropertyAll(
            Size(
              width ?? double.infinity,
              height ?? AppSize.s60.h,
            ),
          ),
          maximumSize: MaterialStatePropertyAll(
            Size(AppSize.s400.w, AppSize.s100.h),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? AppSize.s20.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: buildButtonChild(
          context: context,
          buttonType: buttonType,
          text: text,
          iconSize: iconSize,
          fontSize: fontSize,
          matchFontColor: matchFontColor,
          fontColor: fontColor ?? Theme.of(context).colorScheme.surfaceVariant,
          iconColor: iconColor,
          svgIconPath: svgIconPath,
        ));
  }
}
