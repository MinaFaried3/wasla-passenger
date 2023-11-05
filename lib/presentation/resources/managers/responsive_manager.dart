import 'package:flutter/material.dart';

class ResponsiveManager {
  static late MediaQueryData mediaQueryData;

  late final double screenWidth;
  late final double screenHeight;
  late final double bodyHeight;

  // late double defaultSize;
  late final Orientation orientation;

  //default appbar height
  late final Size appBarHeight;

  ResponsiveManager(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    orientation = mediaQueryData.orientation;
    appBarHeight = Size.fromHeight(screenHeight * 0.06639566395663957);
    bodyHeight = screenHeight -
        mediaQueryData.viewPadding.top -
        mediaQueryData.viewPadding.bottom -
        appBarHeight.height;
  }

  bool isLandScape() {
    return orientation == Orientation.landscape ? true : false;
  }

  double getScreenHeightPercentage(double percentage) =>
      screenHeight * percentage / 100;

  double getBodyHeightPercentage(double percentage) =>
      bodyHeight * percentage / 100;

  double getWidthPercentage(double percentage) =>
      screenWidth * percentage / 100;

  SizedBox space(double p) => SizedBox(
        height: getBodyHeightPercentage(p),
      );
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight, BuildContext context) {
  final sizeConfig = ResponsiveManager(context);

  double screenHeight = sizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth, BuildContext context) {
  final sizeConfig = ResponsiveManager(context);

  double screenWidth = sizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
