import 'package:flutter/material.dart';

class ColorsManager {
  //last palette

  //dark teal
  static const Color darkTealBackground1 = Color(0xff051215);
  static const Color darkTealBackground2 = Color(0xff07161B);
  static const Color darkTealBackground3 = Color(0xff1C3039);
  static const Color darkTealBackground4 = Color(0xff26353A);
  static const Color darkTealBackground5 = Color(0xff2F4249);
  static const Color darkTealBackground6 = Color(0xff394345);

  static const Color darkTealBackground1000 = Color(0xff2A525F);
  static const Color darkTealBackground900 = Color(0xff447281);

  static const Color darkTeal = Color(0xff1C3039);
  static const Color lightTeal = Color(0xff548E99);

  static const Color tealPrimary = Color(0xff3D737F);
  static const Color tealPrimary1000 = Color(0xff1C3D45);
  static const Color tealPrimary900 = Color(0xff2B5862);
  static const Color tealPrimary800 = Color(0xff3D737F);
  static const Color tealPrimary700 = Color(0xff518F9C);
  static const Color tealPrimary600 = Color(0xff68AAB9);
  static const Color tealPrimary500 = Color(0xff80C7D6);
  static const Color tealPrimary400 = Color(0xff9CE4F4);
  static const Color tealPrimary300 = Color(0xffBDF2FD);
  static const Color tealPrimary200 = Color(0xffDAF8FF);
  static const Color tealPrimary100 = Color(0xffF6FDFF);

  //offWhite
  static const Color lightOffWhiteBase = Color(0xffE4DFDC);

  static const Color offWhite = Color(0xffCEC7BF);
  static const Color lightOffWhite = Color(0xffb6b3b0);
  static const Color offWhite1000 = Color(0xff464039);
  static const Color offWhite900 = Color(0xff5D564E);
  static const Color offWhite800 = Color(0xff736C63);
  static const Color offWhite700 = Color(0xff8A8279);
  static const Color offWhite600 = Color(0xffA1998F);
  static const Color offWhite500 = Color(0xffB7B0A7);
  static const Color offWhite400 = Color(0xffCEC7BF);
  static const Color offWhite300 = Color(0xffE5DFD8);
  static const Color offWhite200 = Color(0xffFBF7F2);
  static const Color offWhite100 = Color(0xffFDFDFC);

  //yellow
  static const Color yellow = Color(0xffF1B24A);
  static const Color yellow1000 = Color(0xff472E05);
  static const Color yellow900 = Color(0xff69460C);
  static const Color yellow800 = Color(0xff8B5F17);
  static const Color yellow700 = Color(0xffAD7A25);
  static const Color yellow600 = Color(0xffCF9536);
  static const Color yellow500 = Color(0xffF1B24A);
  static const Color yellow400 = Color(0xffFFCB76);
  static const Color yellow300 = Color(0xffFFDA9E);
  static const Color yellow200 = Color(0xffFFE9C5);
  static const Color yellow100 = Color(0xffFFF8ED);

  //red
  static const Color red = Color(0xffE3596D);
  static const Color red1000 = Color(0xff5B141E);
  static const Color red900 = Color(0xff7D212E);
  static const Color red800 = Color(0xff9F3141);
  static const Color red700 = Color(0xffC14356);
  static const Color red600 = Color(0xffE3596D);
  static const Color red500 = Color(0xffFF6F84);
  static const Color red400 = Color(0xffFF6F84);
  static const Color red300 = Color(0xffFFB0BB);
  static const Color red200 = Color(0xffFFD0D7);
  static const Color red100 = Color(0xffFFF0F2);

  //Grey back ground
  static const Color grey1 = Color(0xff707070);
  static const Color grey2 = Color(0xff797979);
  static const Color brownGrey = Color(0xff5D564E);

  static const Color grey = Color(0xff1F1F1F);
  static const Color grey1000 = Color(0xff484848);
  static const Color grey900 = Color(0xff5C5C5C);
  static const Color grey800 = Color(0xff5C5C5C);
  static const Color grey700 = Color(0xff5C5C5C);
  static const Color grey600 = Color(0xff999999);
  static const Color grey500 = Color(0xffAEAEAE);
  static const Color grey400 = Color(0xffC2C2C2);
  static const Color grey300 = Color(0xffD6D6D6);
  static const Color grey200 = Color(0xffEBEBEB);
  static const Color grey100 = Color(0xffFFFFFF);

  static const Color lightViolet = Color(0xff201C31);
  static const Color darkViolet = Color(0xff1A1727);
  static const Color violet = Color(0xff3E355E);

  static const Color lightBlackViolet = Color(0xff131121);
  static const Color darkBlackViolet = Color(0xff0E0D1A);

  static const Color blackNavy = Color(0xff0a0c13);
  static const Color darkNavy = Color(0xff0d101c);
  static const Color navy = Color(0xff15192b);
  static const Color lightNavy = Color(0xff252c49);
  static const Color blue = Color(0xff3d5887);
  static const Color lightBlue = Color(0xff909dbd);

  static const Color paleVioletRed = Color(0xffba5874);
  static const Color mauva = Color(0xff645577);
  static const Color thistle = Color(0xffa1859c);
  static const Color lightFuchsia = Color(0xffF5D7DB);
  static const Color beige1 = Color(0xffF5e9d0);
  static const Color beige2 = Color(0xfff6d6c5);
  static const Color calico = Color(0xffd8b188);
  static const Color twine = Color(0xffc18653);

  // new colors

  static const Color white = Color(0xffFFFFFF);
  static const Color error = Color(0xffe61f34); // red color
}

class GradientManager {
  static const List<Color> startNowGradient = [
    ColorsManager.tealPrimary1000,
    ColorsManager.darkTealBackground2,
    ColorsManager.darkTealBackground1,
  ];

  static const List<double> startNowStops = [
    0.1,
    0.6,
    0.7,
  ];
}
