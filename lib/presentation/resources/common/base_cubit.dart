import 'package:wasla/app/shared/common/common_libs.dart';

//todo
mixin BaseCubit<T extends Cubit> {
  static Cubit getInstance<T extends Cubit>(BuildContext context) =>
      BlocProvider.of<T>(context);
}
