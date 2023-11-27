import 'package:wasla/app/shared/common/common_libs.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: FontConstants.arabicFontFamily,
      color: color,
      fontWeight: fontWeight);
}

// extra style
TextStyle getExtraLightStyle(
    {double fontSize = FontSize.s10, required Color color}) {
  return _getTextStyle(fontSize.sp, FontWeightManager.extraLight, color);
}

// light style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize.sp, FontWeightManager.light, color);
}

// regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s14, required Color color}) {
  return _getTextStyle(fontSize.sp, FontWeightManager.regular, color);
}

// medium style
TextStyle getMediumStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize.sp, FontWeightManager.medium, color);
}

// semiBold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize.sp, FontWeightManager.semiBold, color);
}

// bold style
TextStyle getBoldStyle({double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize.sp, FontWeightManager.bold, color);
}

// extra bold style
TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize.sp, FontWeightManager.extraBold, color);
}

// black style
TextStyle getBlackStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize.sp, FontWeightManager.black, color);
}
