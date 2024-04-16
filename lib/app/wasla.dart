import 'package:wasla/app/shared/common/common_libs.dart';

class WaslaApp extends StatefulWidget {
  final Routes route;

  //named constructor
  const WaslaApp._internal({required this.route});

  //singleton instance
  static WaslaApp? _instance;

  factory WaslaApp({required Routes route}) {
    _instance ??= WaslaApp._internal(route: route);
    return _instance!;
  }

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
    return BlocProvider(
      create: (context) => getIt<LocalCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(
          AppConstants.screenUtilWidth,
          AppConstants.screenUtilHeight,
        ),
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
          // initialRoute: widget.route.path,
          initialRoute: Routes.home.path,
        ),
      ),
    );
  }
}
