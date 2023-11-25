import 'package:flutter/services.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';

//todo colors
ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // main colors
    primaryColor: ColorsManager.tealPrimary,
    primaryColorLight: ColorsManager.tealPrimary200,
    focusColor: ColorsManager.thistle,
    primaryColorDark: ColorsManager.mauva,
    disabledColor: ColorsManager.grey1,
    splashColor: ColorsManager.beige1,
    scaffoldBackgroundColor: ColorsManager.darkTealBackground2,
    // ripple effect color
    // cardView theme
    cardTheme: const CardTheme(
        color: ColorsManager.beige1,
        shadowColor: ColorsManager.grey1,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorsManager.blackNavy,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: ColorsManager.darkNavy,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        centerTitle: true,
        color: ColorsManager.blackNavy,
        elevation: AppSize.s0,
        // shadowColor: ColorManager.lightPrimary,
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s16, color: ColorsManager.beige1)),
    // button theme
    buttonTheme: const ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorsManager.grey1,
        buttonColor: ColorsManager.paleVioletRed,
        splashColor: ColorsManager.beige1),

    // text button theme
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                const MaterialStatePropertyAll(ColorsManager.lightBlue),
            textStyle: MaterialStatePropertyAll(getSemiBoldStyle(
                color: ColorsManager.navy, fontSize: FontSize.s16)))),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorsManager.mauva, fontSize: FontSize.s17),
            backgroundColor: ColorsManager.paleVioletRed,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorsManager.white,
    ),

    //todo
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorsManager.offWhite200, fontSize: FontSize.s16),
        headlineLarge: getSemiBoldStyle(
            color: ColorsManager.offWhite200, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(
            color: ColorsManager.offWhite200, fontSize: FontSize.s14),
        titleMedium: getMediumStyle(
            color: ColorsManager.offWhite200, fontSize: FontSize.s16),
        titleSmall: getRegularStyle(
            color: ColorsManager.offWhite200, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: ColorsManager.offWhite200),
        bodySmall: getRegularStyle(color: ColorsManager.offWhite200),
        bodyMedium: getRegularStyle(
            color: ColorsManager.offWhite200, fontSize: FontSize.s12),
        labelSmall: getBoldStyle(
            color: ColorsManager.lightFuchsia, fontSize: FontSize.s12)),
//text selection
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: ColorsManager.tealPrimary,
        selectionColor: ColorsManager.tealPrimary900,
        selectionHandleColor: ColorsManager.tealPrimary600),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        // content padding
        contentPadding: const EdgeInsets.symmetric(
            vertical: AppSize.s14, horizontal: AppSize.s8),
        // hint style
        hintStyle: getRegularStyle(
            color: ColorsManager.offWhite500.withOpacity(AppSize.s0_75),
            fontSize: AppSize.s28.sp),
        //align label
        alignLabelWithHint: true,
        labelStyle: getRegularStyle(
            color: ColorsManager.offWhite500.withOpacity(AppSize.s0_75),
            fontSize: AppSize.s20.sp),
        errorStyle:
            getRegularStyle(color: ColorsManager.red700, fontSize: AppSize.s14),
        errorMaxLines: AppConstants.one,

        //filled colors
        filled: true,
        fillColor: ColorsManager.tealPrimary1000,

        // enabled border style
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),

        // focused border style
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorsManager.darkTealBackground900,
                width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),

        // error border style
        errorBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorsManager.red700, width: AppSize.s1),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),

        // focused border style
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)))),
    // label style
  );
}
