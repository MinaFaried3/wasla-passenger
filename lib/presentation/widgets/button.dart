import 'package:wasla/app/shared/common/common_libs.dart';

part 'package:wasla/presentation/common/enums/button_type_enum.dart';

class AppButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final ButtonType buttonType;
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
    this.buttonType = ButtonType.text,
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
    ButtonType buttonType = ButtonType.text,
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
              Size(AppSize.s100.w, AppSize.s40.h),
            ),
            maximumSize: MaterialStatePropertyAll(
              Size(AppSize.s400.w, AppSize.s100.h),
            ),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s20.r)))),
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
          colorFilter: ColorFilter.mode(
            fontColor ?? ColorsManager.tealPrimary800,
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
            color: fontColor ?? Theme.of(context).colorScheme.surfaceVariant,
            fontSize: fontSize ?? FontSize.s24.sp);
      case ButtonType.icon:
        return getSemiBoldStyle(
            color: fontColor ?? Theme.of(context).colorScheme.surfaceVariant,
            fontSize: fontSize ?? FontSize.s24.sp);
      case ButtonType.iconText:
        return getLightStyle(
            color: fontColor ?? Theme.of(context).colorScheme.surfaceVariant,
            fontSize: fontSize ?? FontSize.s24.sp);
    }
  }
}
