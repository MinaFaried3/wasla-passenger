import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wasla/presentation/resources/strings_manager.dart';
import 'package:wasla/presentation/resources/theme_manager.dart';

class WaslaApp extends StatelessWidget {
  //named constructor
  const WaslaApp._internal();

  //singleton instance
  static const WaslaApp _instance = WaslaApp._internal();

  factory WaslaApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appTitle,
              darkTheme: getApplicationTheme(),
              themeMode: ThemeMode.dark,
              home: child,
            ),
        child: Scaffold());
  }
}
