import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/enums/button_type_enum.dart';
import 'package:wasla/presentation/widgets/buttons/buttons_methods.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final ButtonContentType buttonType;
  final String? svgIconPath;
  final Color? backgroundColor;
  final Color? fontColor;

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
  });

  factory AppButton.dark({
    required String text,
    required void Function() onPressed,
    double? width,
    double? height,
    double? fontSize,
    ButtonContentType buttonType = ButtonContentType.text,
    String? svgIconPath,
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
          minimumSize: MaterialStatePropertyAll(
            Size(AppSize.s40.w, AppSize.s20.h),
          ),
          maximumSize: MaterialStatePropertyAll(
            Size(AppSize.s400.w, AppSize.s100.h),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s20.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: buildButtonChild(
          context: context,
          buttonType: buttonType,
          text: text,
          fontSize: fontSize,
          fontColor: fontColor ?? Theme.of(context).colorScheme.surfaceVariant,
          svgIconPath: svgIconPath,
        ));
  }
}
