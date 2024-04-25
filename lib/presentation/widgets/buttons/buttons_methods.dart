import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/enums/button_type_enum.dart';

Widget buildButtonChild({
  required BuildContext context,
  required ButtonContentType buttonType,
  String? svgIconPath,
  required Color fontColor,
  Color? iconColor,
  required String text,
  double? fontSize,
  double? iconSize,
  bool matchFontColor = false,
}) {
  switch (buttonType) {
    case ButtonContentType.text:
      return buildText(context, text, buttonType, fontColor, fontSize);
    case ButtonContentType.icon:
      return buildIcon(
          context, svgIconPath, fontColor, iconColor, iconSize, matchFontColor);
    case ButtonContentType.iconText:
      return FittedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildIcon(context, svgIconPath, fontColor, iconColor, iconSize,
                  matchFontColor),
              HorizontalSpace(AppSize.s4.w),
              buildText(context, text, buttonType, fontColor, fontSize),
            ],
          ),
        ),
      );
  }
}

Widget buildIcon(BuildContext context, String? svgIconPath, Color fontColor,
        Color? iconColor, double? iconSize, bool matchFontColor) =>
    svgIconPath != null
        ? SvgPicture.asset(
            svgIconPath,
            height: iconSize ?? AppSize.s37_5.sp,
            matchTextDirection: true,
            colorFilter: ColorFilter.mode(
              iconColor ??
                  (matchFontColor ? fontColor : ColorsManager.tealPrimary500),
              BlendMode.srcIn,
            ),
          )
        : const SizedBox.shrink();

Widget buildText(BuildContext context, String text,
    ButtonContentType buttonType, Color fontColor, double? fontSize) {
  return FittedBox(
    child: Text(
      text,
      style: buildStyle(context, buttonType, fontColor, fontSize),
      textAlign: TextAlign.center,
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.fade,
    ),
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
