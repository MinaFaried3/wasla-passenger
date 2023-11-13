import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:wasla/app/shared/bloc_observer.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/wasla.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DIModulesManger.prepareAppModule();

  Bloc.observer = getIt<MyBlocObserver>();

  runApp(EasyLocalization(
      supportedLocales: const [
        LocalizationManager.arabicLocal,
        LocalizationManager.englishLocal,
      ],
      path: LocalizationManager.assetsPath,
      child: Phoenix(
        child: WaslaApp(),
      )));
}
