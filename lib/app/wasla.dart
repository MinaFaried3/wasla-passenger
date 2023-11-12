import 'package:wasla/app/shared/common/common_libs.dart';

class WaslaApp extends StatefulWidget {
  //named constructor
  const WaslaApp._internal();

  //singleton instance
  static const WaslaApp _instance = WaslaApp._internal();

  factory WaslaApp() => _instance;

  @override
  State<WaslaApp> createState() => _WaslaAppState();
}

class _WaslaAppState extends State<WaslaApp> {
  @override
  void didChangeDependencies() {
    context.setLocale(LocalizationManager.arabicLocal);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
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
