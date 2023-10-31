import 'package:wasla/app/shared/bloc_observer.dart';
import 'package:wasla/app/wasla.dart';
import 'package:wasla/presentation/resources/common/common_libs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(WaslaApp());
}
