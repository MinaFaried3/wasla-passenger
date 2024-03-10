import 'dart:io';

import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:wasla/app/shared/common/bloc_observer.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/wasla.dart';
import 'package:wasla/data/network/http_overrides.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //todo
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //todo
  HttpOverrides.global = AppHttpOverrides();

  await EasyLocalization.ensureInitialized();
  await DIModulesManger.prepareAppModule();

  Bloc.observer = getIt<MyBlocObserver>();

  final Routes openingRoute = await getIt<AppPreferences>().getOpeningRoute();
  PrintManager.print("the opening route is $openingRoute",
      color: ConsoleColor.blueBg);

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
