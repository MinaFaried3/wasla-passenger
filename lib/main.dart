import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:wasla/app/shared/bloc_observer.dart';
import 'package:wasla/app/wasla.dart';
import 'package:wasla/presentation/resources/common/common_libs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  runApp(EasyLocalization(
      child: Phoenix(
        child: WaslaApp(),
      ),
      supportedLocales: [
        LocalizationManager.arabicLocal,
        LocalizationManager.englishLocal,
      ],
      path: LocalizationManager.assetsPath));
}
