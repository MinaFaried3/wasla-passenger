import 'package:wasla/app/shared/common/common_libs.dart';

class FittedFlexible extends StatelessWidget {
  const FittedFlexible({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: FittedBox(
      child: child,
    ));
  }
}
