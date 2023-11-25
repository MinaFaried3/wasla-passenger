import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:wasla/app/shared/common/bloc_observer.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/wasla.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await EasyLocalization.ensureInitialized();
  await DIModulesManger.prepareAppModule();

  Bloc.observer = getIt<MyBlocObserver>();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        LocalizationManager.arabicLocal,
        LocalizationManager.englishLocal,
      ],
      path: LocalizationManager.assetsPath,
      child: Phoenix(
        child: WaslaApp(),
      ),
    ),
  );

  // whenever initialization is completed, remove the splash screen:
  FlutterNativeSplash.remove();
}
