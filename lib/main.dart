import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:wasla/app/services/hive/hive_constants.dart';
import 'package:wasla/app/shared/common/bloc_observer.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/wasla.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //todo
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //todo
  // HttpOverrides.global = AppHttpOverrides();

  await Hive.initFlutter();
  HiveConstants.registerHiveTypeAdapters();

  await EasyLocalization.ensureInitialized();
  await DIModulesManger.prepareAppModule();

  Bloc.observer = getIt<MyBlocObserver>();

  final Routes openingRoute = await getIt<AppPreferences>().getOpeningRoute();
  PrintManager.print("the opening route is $openingRoute",
      color: ConsoleColor.blueBg);

  // getIt<RemoteDataSource>().getSuggestionsTrips();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        LocalizationManager.arabicLocal,
        LocalizationManager.englishLocal,
      ],
      path: LocalizationManager.assetsPath,
      child: Phoenix(
        child: WaslaApp(
          route: openingRoute,
        ),
      ),
    ),
  );
  //todo
  // whenever initialization is completed, remove the splash screen:
  // FlutterNativeSplash.remove();
}
