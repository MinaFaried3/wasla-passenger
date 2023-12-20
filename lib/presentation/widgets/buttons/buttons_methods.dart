import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/enums/button_type_enum.dart';

Widget buildButtonChild(
    {required BuildContext context,
    required ButtonContentType buttonType,
    String? svgIconPath,
    required Color fontColor,
    required String text,
    double? fontSize}) {
  switch (buttonType) {
    case ButtonContentType.text:
      return buildText(context, text, buttonType, fontColor, fontSize);
    case ButtonContentType.icon:
      return buildIcon(context, svgIconPath, fontColor);
    case ButtonContentType.iconText:
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildIcon(context, svgIconPath, fontColor),
          HorizontalSpace(AppSize.s8.w),
          buildText(context, text, buttonType, fontColor, fontSize),
        ],
      );
  }
}

Widget buildIcon(BuildContext context, String? svgIconPath, Color fontColor) =>
    svgIconPath != null
        ? SvgPicture.asset(
            svgIconPath,
            height: AppSize.s37_5.sp,
            matchTextDirection: true,
            colorFilter: const ColorFilter.mode(
              ColorsManager.tealPrimary800,
              BlendMode.srcIn,
            ),
          )
        : const SizedBox.shrink();

Text buildText(BuildContext context, String text, ButtonContentType buttonType,
    Color fontColor, double? fontSize) {
  return Text(
    text,
    style: buildStyle(context, buttonType, fontColor, fontSize),
  );
}

TextStyle buildStyle(BuildContext context, ButtonContentType buttonType,
    Color fontColor, double? fontSize) {
  switch (buttonType) {
    case ButtonContentType.text:
      return getSemiBoldStyle(
          color: fontColor, fontSize: fontSize ?? FontSize.s24.sp);
    case ButtonContentType.icon:
      return getSemiBoldStyle(
          color: fontColor, fontSize: fontSize ?? FontSize.s24.sp);
    case ButtonContentType.iconText:
      return getLightStyle(
          color: fontColor, fontSize: fontSize ?? FontSize.s24.sp);
  }
}
