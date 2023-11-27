import 'package:flutter/services.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/shared/common/constants.dart';

class ThemeManger {
  static const ColorScheme colorScheme = ColorScheme(
    //primary main color for selected and elevated text and indicator
    primary: ColorsManager.tealPrimary,
    //color of icons on primary color
    onPrimary: ColorsManager.offWhite,
    //color of backgrounds like avatar of flouting buttons
    primaryContainer: ColorsManager.tealPrimary700,
    // color of icon on onPrimary
    onPrimaryContainer: ColorsManager.offWhite300,
    brightness: Brightness.dark,
    //color of background
    background: ColorsManager.darkTealBackground2,

    tertiary: ColorsManager.tealPrimary600,
    //back color for am or pm in time picker
    tertiaryContainer: ColorsManager.offWhite200,

    //color for am or pm in time picker
    onTertiaryContainer: ColorsManager.tealPrimary600,

    //outline color in date picker under the date and  dividers or decorative elements.
    outlineVariant: ColorsManager.tealPrimary300,

    //color of all borders and color of dot switch
    outline: ColorsManager.lightTeal,

    //input validation errors InputDecoration.errorText.
    error: ColorsManager.red700,

    //background of appbar, elevated button and  Card. and pickers(date)
    surface: ColorsManager.tealPrimary1000,
    //mix with surface color
    surfaceTint: null,
    //font color that on only on background
    onSurface: ColorsManager.offWhite300,
    //date title in date picker and icon button color ,and switching color of switch,and unselected checkbox
    onSurfaceVariant: ColorsManager.tealPrimary600,
    //color of hour on time picker and back color of linear indicator, back ground of false switch
    surfaceVariant: ColorsManager.tealPrimary900,
    //like snackBar for background
    inverseSurface: ColorsManager.darkTealBackground3,
    shadow: ColorsManager.lightOffWhite,

    //unused
    //appbar back ground you make
    inversePrimary: ColorsManager.tealPrimary400,
    //colors of borders on background
    onBackground: ColorsManager.offWhite500,
    //secondary
    secondary: ColorsManager.yellow,
    secondaryContainer: ColorsManager.yellow300,
    onSecondary: ColorsManager.grey,
    onSecondaryContainer: ColorsManager.yellow1000,

    //error
    onError: ColorsManager.red300,
    errorContainer: ColorsManager.red400,
    onErrorContainer: ColorsManager.red900,
    //surface
    onInverseSurface: ColorsManager.grey400,
    //tertiary
    onTertiary: ColorsManager.tealPrimary300,
    //scrim
    // scrim: Colors.purple,
  );

  static const CardTheme cardTheme = CardTheme(
      color: ColorsManager.beige1,
      shadowColor: ColorsManager.grey1,
      elevation: AppSize.s4);

  static final AppBarTheme appBarTheme = AppBarTheme(
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
      titleTextStyle:
          getRegularStyle(fontSize: FontSize.s16, color: ColorsManager.beige1));

  static const ButtonThemeData buttonThemeData = ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorsManager.grey1,
      buttonColor: ColorsManager.paleVioletRed,
      splashColor: ColorsManager.beige1);

  static final TextButtonThemeData textButtonThemeData = TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor:
              const MaterialStatePropertyAll(ColorsManager.tealPrimary700),
          textStyle: MaterialStatePropertyAll(getBoldStyle(
              color: ColorsManager.tealPrimary700,
              fontSize: FontSize.s22.sp))));

  static final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(
                  color: ColorsManager.mauva, fontSize: FontSize.s17),
              backgroundColor: ColorsManager.paleVioletRed,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12))));

  //todo
  static final TextTheme textTheme = TextTheme(
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
          color: ColorsManager.lightFuchsia, fontSize: FontSize.s12));

  static const BottomSheetThemeData bottomSheetThemeData = BottomSheetThemeData(
    backgroundColor: ColorsManager.white,
  );

  static const TextSelectionThemeData textSelectionThemeData =
      TextSelectionThemeData(
          cursorColor: ColorsManager.tealPrimary,
          selectionColor: ColorsManager.tealPrimary900,
          selectionHandleColor: ColorsManager.tealPrimary600);

  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
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
              color: ColorsManager.darkTealBackground900, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),

      // error border style
      errorBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorsManager.red700, width: AppSize.s1),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))),

      // focused border style
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s20))));
}

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // main colors
    colorScheme: ThemeManger.colorScheme,
    primaryColor: ColorsManager.tealPrimary,
    primaryColorLight: ColorsManager.tealPrimary200,
    focusColor: ColorsManager.thistle,
    primaryColorDark: ColorsManager.mauva,
    disabledColor: ColorsManager.grey1,
    splashColor: ColorsManager.beige1,
    scaffoldBackgroundColor: ColorsManager.darkTealBackground2,
    // ripple effect color
    // cardView theme
    cardTheme: ThemeManger.cardTheme,
    // app bar theme
    appBarTheme: ThemeManger.appBarTheme,
    // button theme
    buttonTheme: ThemeManger.buttonThemeData,

    // text button theme
    textButtonTheme: ThemeManger.textButtonThemeData,

    // elevated button theme
    elevatedButtonTheme: ThemeManger.elevatedButtonThemeData,

    bottomSheetTheme: ThemeManger.bottomSheetThemeData,

    textTheme: ThemeManger.textTheme,
    //text selection
    textSelectionTheme: ThemeManger.textSelectionThemeData,

    // input decoration theme (text form field)
    inputDecorationTheme: ThemeManger.inputDecorationTheme,
    // label style
  );
}
