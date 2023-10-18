import 'package:flutter/material.dart';
import 'package:wasla/presentation/resources/color_manager.dart';
import 'package:wasla/presentation/resources/font_manager.dart';
import 'package:wasla/presentation/resources/styles_manager.dart';
import 'package:wasla/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.teal,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.navy,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightFuchsia,
    scaffoldBackgroundColor: ColorManager.white,
    // ripple effect color
    // cardView theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.lightFuchsia,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.white,
        elevation: AppSize.s0,
        // shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)),
    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.orange,
        splashColor: ColorManager.lightPrimary),

    // text button theme
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                const MaterialStatePropertyAll(ColorManager.orange),
            textStyle: MaterialStatePropertyAll(getSemiBoldStyle(
                color: ColorManager.lightFuchsia, fontSize: FontSize.s16)))),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17),
            backgroundColor: ColorManager.teal,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorManager.white,
    ),
    textTheme: TextTheme(
        displayLarge:
            getSemiBoldStyle(color: ColorManager.navy, fontSize: FontSize.s16),
        headlineLarge:
            getSemiBoldStyle(color: ColorManager.navy, fontSize: FontSize.s16),
        headlineMedium:
            getRegularStyle(color: ColorManager.navy, fontSize: FontSize.s14),
        titleMedium:
            getMediumStyle(color: ColorManager.teal, fontSize: FontSize.s16),
        titleSmall:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: ColorManager.grey1),
        bodySmall: getRegularStyle(color: ColorManager.grey2),
        bodyMedium:
            getRegularStyle(color: ColorManager.grey2, fontSize: FontSize.s12),
        labelSmall:
            getBoldStyle(color: ColorManager.teal, fontSize: FontSize.s12)),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
            getRegularStyle(color: ColorManager.grey2, fontSize: FontSize.s14),
        labelStyle:
            getMediumStyle(color: ColorManager.grey2, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey1, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.teal, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.teal, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
