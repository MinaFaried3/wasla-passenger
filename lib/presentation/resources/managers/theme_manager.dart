import 'package:flutter/services.dart';
import 'package:wasla/presentation/resources/common/common_libs.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // main colors
    primaryColor: ColorManager.thistle,
    primaryColorLight: ColorManager.lightFuchsia,
    primaryColorDark: ColorManager.mauva,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.beige1,
    scaffoldBackgroundColor: ColorManager.darkBlackViolet,
    // ripple effect color
    // cardView theme
    cardTheme: CardTheme(
        color: ColorManager.beige1,
        shadowColor: ColorManager.grey1,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.blackNavy,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: ColorManager.darkNavy,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        centerTitle: true,
        color: ColorManager.blackNavy,
        elevation: AppSize.s0,
        // shadowColor: ColorManager.lightPrimary,
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s16, color: ColorManager.beige1)),
    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.paleVioletRed,
        splashColor: ColorManager.beige1),

    // text button theme
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                const MaterialStatePropertyAll(ColorManager.lightBlue),
            textStyle: MaterialStatePropertyAll(getSemiBoldStyle(
                color: ColorManager.navy, fontSize: FontSize.s16)))),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.mauva, fontSize: FontSize.s17),
            backgroundColor: ColorManager.paleVioletRed,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorManager.white,
    ),
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: ColorManager.beige1, fontSize: FontSize.s16),
        headlineLarge: getSemiBoldStyle(
            color: ColorManager.beige1, fontSize: FontSize.s16),
        headlineMedium:
            getRegularStyle(color: ColorManager.beige1, fontSize: FontSize.s14),
        titleMedium:
            getMediumStyle(color: ColorManager.beige1, fontSize: FontSize.s16),
        titleSmall:
            getRegularStyle(color: ColorManager.beige1, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: ColorManager.beige1),
        bodySmall: getRegularStyle(color: ColorManager.beige1),
        bodyMedium:
            getRegularStyle(color: ColorManager.beige1, fontSize: FontSize.s12),
        labelSmall: getBoldStyle(
            color: ColorManager.lightFuchsia, fontSize: FontSize.s12)),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: getRegularStyle(
            color: ColorManager.lightFuchsia, fontSize: FontSize.s14),
        labelStyle: getMediumStyle(
            color: ColorManager.lightFuchsia, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey1, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.paleVioletRed, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.paleVioletRed, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
