import 'package:wasla/app/shared/common/common_libs.dart';

class ConditionalBuilder extends StatelessWidget {
  const ConditionalBuilder(
      {super.key,
      required this.condition,
      required this.onTrue,
      required this.onFalse});

  final bool condition;
  final Widget onTrue;
  final Widget onFalse;

  @override
  Widget build(BuildContext context) {
    return condition ? onTrue : onFalse;
  }
}
