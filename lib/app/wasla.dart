import 'package:wasla/presentation/resources/common/common_libs.dart';

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
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: RoutesStrings.loginRoute,
      ),
    );
  }
}
