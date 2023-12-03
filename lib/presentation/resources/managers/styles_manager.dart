import 'package:wasla/app/shared/common/common_libs.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.arabicFontFamily,
      color: color,
      fontWeight: fontWeight);
}

// extra style
TextStyle getExtraLightStyle(
    {double fontSize = FontSize.s10, Color color = ColorsManager.offWhite300}) {
  return _getTextStyle(fontSize, FontWeightManager.extraLight, color);
}

// light style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12, Color color = ColorsManager.offWhite300}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s14, Color color = ColorsManager.offWhite300}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style
TextStyle getMediumStyle(
    {double fontSize = FontSize.s16, Color color = ColorsManager.offWhite300}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// semiBold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s16, Color color = ColorsManager.offWhite300}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

// bold style
TextStyle getBoldStyle(
    {double fontSize = FontSize.s16, Color color = ColorsManager.offWhite300}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// extra bold style
TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s16, Color color = ColorsManager.offWhite300}) {
  return _getTextStyle(fontSize, FontWeightManager.extraBold, color);
}

// black style
TextStyle getBlackStyle(
    {double fontSize = FontSize.s16, Color color = ColorsManager.offWhite300}) {
  return _getTextStyle(fontSize, FontWeightManager.black, color);
}
