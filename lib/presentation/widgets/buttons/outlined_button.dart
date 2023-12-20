import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/enums/button_type_enum.dart';
import 'package:wasla/presentation/widgets/buttons/buttons_methods.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width,
      this.height,
      this.fontSize,
      this.buttonType = ButtonContentType.text,
      this.svgIconPath,
      this.backgroundColor,
      this.fontColor,
      this.borderColor});

  final String text;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final ButtonContentType buttonType;
  final String? svgIconPath;
  final Color? backgroundColor;
  final Color? fontColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side: MaterialStatePropertyAll(BorderSide(
          color: borderColor ?? Theme.of(context).colorScheme.onPrimary,
        )),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        foregroundColor: MaterialStatePropertyAll(
          fontColor ?? Theme.of(context).colorScheme.onPrimary,
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
        svgIconPath: svgIconPath,
        fontColor: fontColor ?? Theme.of(context).colorScheme.onPrimary,
        fontSize: fontSize,
      ),
    );
  }
}
